class Snapshot::Parse
  def initialize(snapshot)
    @snapshot = snapshot
  end

  def run
    metrics.each do |metric|
      metric_data = split(metric)

      next unless valid?(metric_data)

      name = metric_data[1].downcase

      create_metric_for(name, data: parsed(metric_data)) if metric_allowed?(name)
    end

    @snapshot.metrics
  end

  private

  def metrics = @snapshot.raw_data.split("\n").reject { _1.match?(/^\+[-+]+\+$/) }

  def split(line) = line.split("|").map(&:strip)

  def valid?(columns)
    columns.present? && !columns.all?(&:empty?) && columns[1].present?
  end

  def create_metric_for(name, data:)
    metric = @snapshot.metrics.build(
      name: name,
      lines: data.lines,
      lines_of_code: data.loc,
      classes: data.classes,
      methods: data.methods
    )

    metric.save! if metric.valid?
  end

  def metric_allowed?(name) = Snapshot::Metric::ALLOWED_NAMES.key?(name.to_sym)

  def parsed(columns)
    MetricData.new(
      name: columns[1],
      lines: columns[2].to_i,
      loc: columns[3].to_i,
      classes: columns[4].to_i,
      methods: columns[5].to_i
    )
  end

  MetricData = Data.define(:name, :lines, :loc, :classes, :methods)
end
