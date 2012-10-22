# coding: utf-8
require 'spec_helper'
require 'eager_loadable_polymorphic_association'

describe EagerLoadablePolymorphicAssociation do
  Paste.class_eval do
    extend EagerLoadablePolymorphicAssociation

    eager_loadable_polymorphic_association :item, [:snippet, :picture]
  end

  context 'included into Paste' do
    let!(:snippet) do
      Snippet.create!(content: 'Lorem porem').tap {|item| Paste.create(item: item) }
    end

    let!(:picture) {
      Picture.create!(url: 'http://example.com/example.jpeg').tap {|item| Paste.create(item: item) }
    }

    before do
      @loaded_pastes = Paste.with_item.order(:id).all
      ActiveRecord::Base.connection.should_not_receive(:select_all)
    end

    specify { @loaded_pastes.map(&:item).should =~ [snippet, picture] }
  end
end

