# frozen_string_literal: true

module PropertiesHelper
  def exterior_features(feature)
    {
      'BY' => 'Backyard',
      'FY' => 'Frontyard',
      'LS' => 'Landscaped',
      'BW' => 'Brick Wall'
    }.each do |k, v|
      feature.gsub!(k, v)
    end
    feature
  end

  def interior_features(feature)
    {
      'CA' => 'Central Air',
      'CF' => 'Central Furnace',
      'IR' => 'Individual Room',
      'FAM' => 'Family Room',
      'LIV' => 'Living Room',
      'STD' => 'Standard',
      'MBTH' => 'Master Bathroom',
      'MBD' => 'Master Bedroom',
      'PRKG' => 'Parking',
      'IN' => 'Interior'
    }.each do |k, v|
      feature.gsub!(k, v)
    end
    feature
  end

  def property_features(feature)
    {
      'STD' => 'Standard',
      'SFR' => 'Single Family Residence',
      'UNK' => 'Unknown',
      'PUB' => 'Public Sewer',
      'SDW' => 'Sidewalk',
      'SL' => 'Street Lighting'

    }.each do |k, v|
      feature.gsub!(k, v)
    end
    feature
  end
end
