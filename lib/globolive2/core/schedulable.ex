defprotocol Globolive2.Core.Schedulable do
  @spec duration(term) :: non_neg_integer
  def duration(value)
end
