# railsstats.com

Products built with Ruby on Rails that share their stats (ie. `bin/rails stats`).

## Run in your app:

```bash
rails runner 'require "rails/code_statistics"; dirs = [["Controllers", "app/controllers"], ["Models", "app/models"], ["Mailers", "app/mailers"], ["Views", "app/views"], ["Jobs", "app/jobs"], ["Libraries", "lib"]]; stats = Rails::CodeStatistics.new(*dirs); data = stats.instance_variable_get(:@statistics).transform_values { |calc| {lines: calc.lines, code_lines: calc.code_lines, classes: calc.classes, methods: calc.methods} }; puts JSON.generate({stats: data})' | curl -X POST -H "Content-Type: application/json" --data-binary @- http://localhost:3000/stats
```

```
# app/models/stats_snapshot.rb
class StatsSnapshot < ApplicationRecord
  has_many :directory_stats, dependent: :destroy

  # Store the raw JSON as well
  serialize :raw_data, JSON

  # Easy filtering by date
  scope :by_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }

  # Optional: Add project name if you want to track multiple projects
  # t.string :project_name
end

# app/models/directory_stat.rb
class DirectoryStat < ApplicationRecord
  belongs_to :stats_snapshot

  # Easy filtering by directory
  scope :controllers, -> { where(directory_name: 'Controllers') }
  scope :models, -> { where(directory_name: 'Models') }
  # etc...
end

class CreateStatsSnapshots < ActiveRecord::Migration[7.0]
  def change
    create_table :stats_snapshots do |t|
      t.json :raw_data
      t.string :project_name  # optional
      t.timestamps
    end
  end
end

class CreateDirectoryStats < ActiveRecord::Migration[7.0]
  def change
    create_table :directory_stats do |t|
      t.references :stats_snapshot, null: false, foreign_key: true
      t.string :directory_name
      t.integer :lines
      t.integer :code_lines
      t.integer :classes
      t.integer :methods
      t.timestamps

      # Add index for faster filtering
      t.index :directory_name
    end
  end
end


class StatsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    stats_data = params[:stats]

    ActiveRecord::Base.transaction do
      # Create the snapshot with raw data
      snapshot = StatsSnapshot.create!(
        raw_data: stats_data,
        # project_name: params[:project_name]  # optional
      )

      # Create individual directory stats
      stats_data.each do |directory_name, stats|
        snapshot.directory_stats.create!(
          directory_name: directory_name,
          lines: stats['lines'],
          code_lines: stats['code_lines'],
          classes: stats['classes'],
          methods: stats['methods']
        )
      end
    end

    render json: { status: 'success' }
  end
end

# Get all snapshots from last month
StatsSnapshot.by_date_range(1.month.ago, Time.current)

# Get controller stats evolution
DirectoryStat.controllers.includes(:stats_snapshot)
  .order('stats_snapshots.created_at')

# Get total lines of code over time
DirectoryStat.group('stats_snapshots.created_at::date')
  .joins(:stats_snapshot)
  .sum(:code_lines)

# Compare two snapshots
snapshot1 = StatsSnapshot.find(1)
snapshot2 = StatsSnapshot.find(2)

diff = snapshot2.directory_stats.each_with_object({}) do |stat, hash|
  old_stat = snapshot1.directory_stats.find_by(directory_name: stat.directory_name)
  hash[stat.directory_name] = {
    lines_diff: stat.lines - (old_stat&.lines || 0),
    code_lines_diff: stat.code_lines - (old_stat&.code_lines || 0),
    classes_diff: stat.classes - (old_stat&.classes || 0),
    methods_diff: stat.methods - (old_stat&.methods || 0)
  }
end


## Other namings

class StatsSnapshot < ApplicationRecord
  has_many :code_metrics  # or
  has_many :code_stats   # or
  has_many :component_stats  # or
  has_many :module_metrics  # or
  has_many :codebase_stats  # or
  has_many :app_components  # or
  has_many :code_segments   # or
  has_many :section_metrics
end
```
