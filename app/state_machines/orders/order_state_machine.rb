module Orders
  module OrderStateMachine
    extend ActiveSupport::Concern

    included do
      include AASM

      aasm column: 'state' do
        state :cart, initial: true
        state :completed
        state :removed

        event :complete do
          transitions from: :cart, to: :completed
        end

        event :remove do
          transitions from: :cart, to: :removed, after: :set_deleted_at
        end
      end
    end

    private

    def set_deleted_at
      update_column(:deleted_at, Time.current)
    end

    def set_created_at
      update_column(:created_at, Time.current)
    end
  end
end
