# DevOps Assignment - Senior DevOps Engineer

Thanks for taking the time to do this assignment. It is deliberately simple: we want to see how you approach a realistic slice of platform work, not how many free hours you can spend. The take-home is the starting point for a live review session where we will dig into your decisions together.

## Time expectation

Aim for **2–3 hours**. We expect that you would make a note in your README of the work done and anything you consciously left out - an honest "here is what I would do next" is worth more to us than extra polish. We do not award points for gold-plating.

## AI tools policy

You may use AI assistants (Claude, ChatGPT, Copilot, etc.) - we use them daily ourselves. Two conditions:

1. You must understand every line you submit.
2. In the review session you will walk us through the code and extend it live, so make sure it is genuinely yours.

## The application

`app/` contains a small Python Flask application with three endpoints:

| Endpoint  | Description                                                  |
|-----------|--------------------------------------------------------------|
| `/`       | Returns a plain-text greeting                                |
| `/config` | Returns configuration values read from environment variables |
| `/health` | Returns a simple health status                               |

Dependencies are pinned in `app/requirements.txt`.

The application is intentionally simple, but **treat it as if it were headed to production**. Part of what we evaluate is what you notice about the code and configuration as you work with it, and how you handle it. If you spot something you would push back on in a real code review, say so in your README, or fix it and explain why.

## Your task

1. **Containerize the application.** Write a production-quality Dockerfile. You do not need to push to a registry - loading the image into a local cluster is fine.
2. **Write a Helm chart** for the application. Configuration and secret values must not be hardcoded in templates. The values themselves can be made up.
3. **Deploy to a local Kubernetes cluster** (kind or Minikube) **using Terraform**. Terraform state can be local. How you draw the boundary between Terraform and Helm is your call - be ready to defend it.
4. **Verify it works**: all three endpoints reachable via `curl` or a browser.
5. **Write a short README** in your repository covering:
   - How to run the solution from scratch (assume a machine with Docker, kind/Minikube, Terraform, and Helm installed).
   - The key decisions you made and why - a few paragraphs, not an essay.
   - Anything you noticed that you would change before this went to production.

That is the whole take-home. **Explicitly not required:** a cloud account, a monitoring stack, or an implemented CI/CD pipeline. We will discuss those topics in the review session instead. A local cluster scores identically to a cloud deployment - please do not spend money on this assignment.

## The review session (~60 minutes)

Your submission is the entry ticket to a conversation, not the final word. In the session we will:

- Have you walk us through your solution and the decisions behind it.
- Extend or debug it together live (for example: adding a second environment, or diagnosing a failing deployment).
- Discuss how you would take this to production on AWS: networking design, granting the application access to AWS services, CI/CD across multiple environments, observability, and the trade-offs involved.

No preparation beyond your own submission is needed, but it is fair warning: we will ask "why" a lot.

## Submission

- [ ] Create a **private** repository in your personal account and push your solution.
- [ ] Confirm your README's run instructions work from a clean checkout.
- [ ] Invite the reviewer accounts we shared with you by email.
- [ ] Reply to our email with the repository link.

We aim to get back to you within a few working days. Good luck - we look forward to reading it.
