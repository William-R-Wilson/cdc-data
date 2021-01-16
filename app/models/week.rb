# frozen string literal
class Week
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state,                                       type: String
  field :year,                                        type: Integer
  field :week,                                        type: Integer
  field :week_ending_date,                            type: Date
  field :all_cause,                                  type: Integer
  field :natural_cause,                              type: Integer
  field :septicemia,                                 type: Integer
  field :malignant_neoplasms,                        type: Integer
  field :diabetes_mellitus,                          type: Integer
  field :alzheimers_disease,                          type: Integer
  field :influenza_and_pneumonia,                    type: Integer
  field :chronic_lower_respiratory,                  type: Integer
  field :other_respiratory,                          type: Integer
  field :nephritis,                                  type: Integer
  field :symptoms_signs_and_abnormal,                type: Integer
  field :diseases_of_heart,                          type: Integer
  field :cerebrovascular_diseases,                   type: Integer
  field :covid_19_multiple_cause_of_death,           type: Integer
  field :covid_19_underlying_cause_of_death,         type: Integer

end
