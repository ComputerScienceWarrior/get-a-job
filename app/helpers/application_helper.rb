module ApplicationHelper
    def project_link(text, portfolio, project, options = {})
        link_to text, portfolio_project_path(portfolio, project), options
    end

    def portfolio_link(text, portfolio, options = {})
        link_to text, portfolio_projects_path(portfolio), options
    end
end
