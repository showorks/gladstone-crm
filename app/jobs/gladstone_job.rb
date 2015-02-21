class GladstoneJob < ActiveJob::Base

  private

    def gs_convert_boolean(value=nil)
      if value.present? && value == "TRUE"
        return true
      else
        return false
      end
    end

    def gs_convert_date(value=nil)
      if value.present?
        return value.to_date
      else
        return nil
      end
    end

end
