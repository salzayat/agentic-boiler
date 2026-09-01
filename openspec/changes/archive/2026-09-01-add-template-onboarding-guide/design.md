# Design: Add Template Onboarding Guide

## A root-level `TEMPLATE.md`, not a new `docs/` page

`docs/` holds durable policy and contributor explanations for people already inside the project
(docs/repository-orientation.md, docs/governance.md, docs/dependency-patterns.md). The onboarding guide's
audience is different: someone who has just run `git clone`/"Use this template" and has not yet read any of
those files. Putting it at the repository root, alongside `README.md`, `CONTRIBUTING.md`, and
`CODE_OF_CONDUCT.md`, makes it discoverable the same way those files are (GitHub renders root `.md` files
prominently; a file under `docs/` does not get that treatment). `TEMPLATE.md` links into `docs/` once the
one-time setup is done, rather than duplicating governance content.

## The guide is an ordered checklist, not prose, because the steps have a hard order

Renaming identity strings before replacing `TEMPLATE:REPLACE` markers would leave a contributor typechecking
and testing example code under the wrong package name partway through, and running `npm run check` before
either step just reproduces the existing quick start with no new information. The four steps (rename →
replace markers → verify → propose first change) are each individually checkable — "did `package.json` get
renamed," "does `grep -r TEMPLATE:REPLACE` return nothing," "did `npm run check` pass," "does a
`/roadmap`-created change exist" — which is why the guide is a checklist rather than narrative like the
README's Design Intent section.

## `greeter` gets the marker too, not a separate "keep or replace" note

`openspec/specs/repository-planning/spec.md:38-42` requires the marker on "tracked example code that is
expected to be replaced or substantially adapted after a clone or fork" — that description matches
`packages/greeter` exactly (it exists solely to demonstrate composition, not as a capability a real project
would keep). Adding the marker keeps the guide's "search for `TEMPLATE:REPLACE`" step complete: a fork owner
who greps for the marker and only finds `hello` would silently miss that `greeter` is also a teaching
fixture, not a foundation.
