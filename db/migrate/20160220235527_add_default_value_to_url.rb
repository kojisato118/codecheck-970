class AddDefaultValueToUrl < ActiveRecord::Migration
  def change
    change_column(:projects, :url, :string, :dafault => "")
    change_column(:lisas, :url, :string, :dafault => "")
    change_column(:qiita_items, :url, :string, :dafault => "")
    change_column(:labs, :url, :string, :dafault => "")
  end
end
