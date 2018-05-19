class SorterWorker
  include Sidekiq::Worker

  def perform(table, email)
    result = Sorter.load_from_csv_string(table).convert_to_csv
    CabinSenderMailer.send_cabin_arrangement(result, email).deliver
  end
end
