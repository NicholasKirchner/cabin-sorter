class SorterWorker
  include Sidekiq::Worker

  def perform(table, email)
    Sorter.load_from_csv_string(table).convert_to_csv("output.csv")
  end
end
