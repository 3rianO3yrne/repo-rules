resource "github_branch_protection" "this" {
  for_each      = toset(data.github_repositories.this.names)
  repository_id = each.key

  pattern                         = "main"
  enforce_admins                  = false
  require_signed_commits          = true
  required_linear_history         = true
  require_conversation_resolution = true

  required_status_checks {
    strict   = true
    contexts = []
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    require_last_push_approval = false
    pull_request_bypassers = ["/${var.owner}"]
  }
}

# query used to target the repos
# see: https://docs.github.com/en/search-github/searching-on-github/searching-for-repositories
# this could be refined to `is:public` or `is:private` to only target public or private repos
# query doesn't included archived repos
data "github_repositories" "this" {
  query           = "user:${var.owner} archived:false is:public"
  include_repo_id = true
}


