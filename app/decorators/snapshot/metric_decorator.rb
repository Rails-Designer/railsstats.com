class Snapshot::MetricDecorator < SimpleDelegator
  def humanized_name
    Snapshot::Metric::ALLOWED_NAMES.key?(name.to_sym) ? Snapshot::Metric::ALLOWED_NAMES[name.to_sym] : name.humanize
  end
end
