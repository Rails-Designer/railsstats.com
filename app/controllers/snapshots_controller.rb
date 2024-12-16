 class SnapshotsController < ApplicationController
  def new
    @snapshot = Snapshot::CreateForm.new
  end

  def create
    # TODO: basic authorization to check if project already exists (based on name + website)
    @snapshot = Snapshot::CreateForm.new(snapshot_params).save

    redirect_to @snapshot.project
  end

  private

  def snapshot_params
    params.expect(snapshot: [ :project_name, :website, :founded_at, :raw_data ])
  end
 end
