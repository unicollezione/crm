MEASUREMENTS = %w[ОГ ОТ ОБ ВБ ВГ ЦГ ШПр ГПр ШС ШГ1 ШГ2 ШГ3 h ДТС ДТП ВПК ОШ ДПЛ ДР ОП ОЗ ВПКП].freeze

class MeasurementsSeed
  class << self
    def call
      MEASUREMENTS.each { |m| Measure.create(tag: m) }
    end
  end
end
