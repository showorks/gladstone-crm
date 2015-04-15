class GladstoneJob

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
        return DateTime.strptime(value, '%m/%d/%Y %H:%M:%S')
      else
        return nil
      end
    end

end
