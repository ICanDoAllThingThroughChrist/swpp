class AddFrequencyDtlToFrequencies < ActiveRecord::Migration[5.1]
  def change
  	 add_column :frequencies, :frequency_dtl, :integer
  end
end
