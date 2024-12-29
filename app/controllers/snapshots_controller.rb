 class SnapshotsController < ApplicationController
  invisible_captcha only: %w[create], timestamp_enabled: false

  def new
    @snapshot = Snapshot::CreateForm.new
  end

  def create
    @snapshot = Snapshot::CreateForm.new(snapshot_params).save

    redirect_to @snapshot.project
  end

  private

  def snapshot_params
    params.expect(snapshot: [ :project_name, :website, :founded_at, :raw_data ])
  end
 end
