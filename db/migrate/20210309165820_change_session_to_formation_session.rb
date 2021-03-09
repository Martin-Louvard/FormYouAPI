class ChangeSessionToFormationSession < ActiveRecord::Migration[6.1]
  def change
    rename_table :sessions, :formationsessions
    rename_column :participations, :session_id, :formationsession_id
  end
end
