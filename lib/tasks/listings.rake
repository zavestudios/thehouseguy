require "csv"
require "date"

namespace :listings do
  desc "Ingest Ames Housing CSV into listings"
  task ingest: :environment do
    path = Rails.root.join("data", "ames-housing.csv")
    unless File.exist?(path)
      abort("Missing dataset: #{path}")
    end

    created = 0
    updated = 0

    CSV.foreach(path, headers: true) do |row|
      listing = Listing.find_or_initialize_by(source: "ames", external_id: row["PID"].to_s)

      full_bath = row["Full.Bath"].to_f
      half_bath = row["Half.Bath"].to_f
      baths = full_bath + (half_bath / 2.0)

      sold_at = begin
        Date.new(row["Yr.Sold"].to_i, row["Mo.Sold"].to_i, 1)
      rescue ArgumentError
        nil
      end

      listing.address_line = nil
      listing.city = "Ames"
      listing.state = "IA"
      listing.zip = nil
      listing.image_url = listing.image_url.presence
      listing.price = row["SalePrice"].to_i
      listing.beds = row["Bedroom.AbvGr"].to_i
      listing.baths = baths
      listing.sqft = row["Gr.Liv.Area"].to_i
      listing.year_built = row["Year.Built"].to_i
      listing.lot_sqft = row["Lot.Area"].to_i
      listing.sold_at = sold_at

      if listing.new_record?
        listing.save!
        created += 1
      elsif listing.changed?
        listing.save!
        updated += 1
      end
    end

    puts "Listings ingest complete: created=#{created} updated=#{updated}"
  end
end
