module Web.View.Articles.New where
import Web.View.Prelude

data NewView = NewView { article :: Article }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Article</h1>
        {renderForm article}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Articles" ArticlesAction
                , breadcrumbText "New Article"
                ]

renderForm :: Article -> Html
renderForm article = formFor article [hsx|
    {(textField #author)}
    {(textField #content)}
    {submitButton}

|]