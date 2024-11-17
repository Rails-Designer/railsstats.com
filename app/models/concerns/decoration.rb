module Decoration
  def decorate(with: nil)
    decorator_class = with || "#{self.class}Decorator".constantize

    decorator_class.new(self)
  end
end
