require 'rails_helper'

describe ChaptersController, :type => :controller do

  describe 'post #CREATE' do

    context 'logged in' do

      it 'does not let the user manually set a value for created at or completed at'

    end

    context 'logged out' do

      it 'redirects users and does not create anything'

    end

  end





end
