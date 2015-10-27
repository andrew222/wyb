class AddCertificateToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :certificate, :string
  end
end
