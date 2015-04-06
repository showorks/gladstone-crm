class CsvFile
  extend CarrierWave::Mount
  extend CarrierWaveDirect::Mount

  mount_uploader :csv_file, CsvFileUploader
end
