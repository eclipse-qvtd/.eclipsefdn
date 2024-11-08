local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-qvtd') {
  settings+: {
    description: "",
    name: "Eclipse QVTd project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "read",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/qvtd/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
}
