# == Schema Information
#
# Table name: protocol_applications
#
#  id             :integer          not null, primary key
#  protocol_id    :integer
#  operator_id    :integer
#  procedure_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ProtocolApplication < ActiveRecord::Base
  attr_accessible :procedure_date

  has_many :samples
  has_many :protocol_parameter_values
  belongs_to :protocol
  belongs_to :operator, class_name: "Contact", foreign_key: 'operator_id'

  has_paper_trail

end
