class AuctionStatus::OpenViewModel < Struct.new(:auction)
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper

  def status_text
    'Open'
  end

  def label_class
    'auction-label-open'
  end

  def label
    'Open'
  end

  def tag_data_value_status
    "#{distance_of_time_in_words(Time.now, auction.end_datetime)} left"
  end

  def tag_data_label_2
    "Bidding"
  end

  def tag_data_value_2
    if !auction.show_bids?
      "Sealed"
    else
      "#{auction.highlighted_bid_amount_as_currency} - #{auction.bids.length} bids"
    end
  end
end
