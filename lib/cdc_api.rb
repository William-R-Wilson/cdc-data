class CdcApi
  require 'httparty'
  include HTTParty


#2014 to 2018 datasets: https://data.cdc.gov/resource/3yf8-kanr.json?jurisdiction_of_occurrence=Tennessee
# 2019-2020 datasets https://data.cdc.gov/resource/muzy-jte6.json?jurisdiction_of_occurrence=Tennessee

  RECENT_DATA_URL = "https://data.cdc.gov/resource/muzy-jte6.json"


  def get_recent_data(year, state)
    result = HTTParty.get("#{RECENT_DATA_URL}?jurisdiction_of_occurrence=#{state}&mmwryear=#{year}")
    result.each do |response|
      puts response['week_ending_date']
      convert_to_2020_week(response)
    end
  end


  def convert_to_2020_week(response)
    week = Week.new(state: response['jurisdiction_of_occurrence'],
                     year: response['mmwryear'].to_i,
                     week: response['mmwrweek'].to_i,
                     week_ending_date: response['week_ending_date'].to_date,
                     all_cause: response['all_cause'].to_i,
                     natural_cause: response['natural_cause'].to_i,
                     septicemia: response['septicemia_a40_a41'].to_i,
                     malignant_neoplasms: response['malignant_neoplasms_c00_c97'].to_i,
                     diabetes_mellitus: response['diabetes_mellitus_e10_e14'].to_i,
                     alzheimers_disease: response['alzheimer_disease_g30'].to_i,
                     influenza_and_pneumonia: response['influenza_and_pneumonia_j09_j18'].to_i,
                     chronic_lower_respiratory: response['chronic_lower_respiratory'].to_i,
                     other_respiratory: response['other_diseases_of_respiratory'].to_i,
                     nephritis: response['nephritis_nephrotic_syndrome'].to_i,
                     symptoms_signs_and_abnormal: response['symptoms_signs_and_abnormal'].to_i,
                     diseases_of_heart: response['diseases_of_heart_i00_i09'].to_i,
                     cerebrovascular_diseases: response['cerebrovascular_diseases'].to_i,
                     covid_19_multiple_cause_of_death: response['covid_19_u071_multiple_cause_of_death'].to_i,
                     covid_19_underlying_cause_of_death: response['covid_19_u071_underlying_cause_of_death'].to_i)
    week.save
  end

end
