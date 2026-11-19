---
name: task-description
description: Write or refine the body of a development task for a tracker (goal, user story, acceptance criteria) as a description of the outcome, cut down to a single slice. Use when the user asks to describe, write up or improve a task; when you are about to create a task in a tracker (ClickUp, GitLab, GitHub); or when another skill needs a task body.
---

# Task description

A task body describes the **outcome**: what is true once the task is done, seen from outside. The implementer chooses how to get there; technical findings from the conversation get their own, separate section. One task is one **slice** (vertical slice): one observable behaviour with its edge cases, from input to effect, sized for one reviewable MR.

This skill produces the content only. Branches, writing to the tracker and workflow belong to other skills.

## Steps

1. **Gather.** Take everything that describes the task: the conversation, pasted text, and, when given a link or `CU-<id>`, the task itself from the tracker (read only). Read the project's conventions (CLAUDE.md, AGENTS.md); see *Project conventions*. Inside a repository, dispatch a subagent for the facts: affected area, domain vocabulary, existing modules and tests, an estimate of the change size. When any condition from *Links* holds, read [`REGULATED.md`](REGULATED.md). Done when you know the behaviour, its recipient and the conventions in force.
2. **Cut the slice.** Name the behaviours the material carries and apply *Task size*. With more than one slice, order the list for execution and continue with the first. Done when you have one slice within every limit.
3. **Write** the title and sections following *Task title* and *Sections*. Move technical detail from the conversation to *Implementation notes* and express its purpose in a criterion.
4. **Check** every criterion against every test in *Acceptance criteria*, and the whole slice against the limits in *Task size*. Rewrite or remove a criterion that fails a test. Done when every criterion passes every test.
5. **Deliver** following *Output*. Look facts up yourself; mark decisions that cannot be established (recipient, benefit, scope boundary, whether the task touches safety) as `?` in the content and ask them in the note as one numbered batch, each question with a recommendation. After the answers, fix the content and deliver it again.

## Task size

The limits are hard; exceeding one means a split, without asking for permission:

- 2 to 5 criteria. A sixth criterion means a second slice.
- Every criterion concerns this slice's behaviour. An **independent** behaviour, one that can be delivered and checked without the others, is a separate slice.
- Move a behaviour with no recipient in this slice (handling a case nothing triggers yet) to the slice that introduces its recipient.
- Split a task touching more than one domain (`scope`) by domain.
- A new module starts with a **tracer bullet**: the module exists, has a public interface and carries one simplest behaviour from input to effect, with a test. Each following slice adds one behaviour (error handling, another mode, configuration).
- Inside a repository: an estimate above ~400 changed lines, tests included, means a split.

A signal to look at the slice again: 3 or more `TEST:` criteria. Each means test code, so together they usually betray two behaviours in one task.

When splitting, deliver the list of slices (a name and one sentence each, in execution order) and the full body of the first one only. Write up the others on request.

## Task title

The core of the title comes from the `task-title` skill (core, type, check question). Add prefixes around the core following the project's conventions; Conventional Commits by default:

`<type>[(<scope>)][!]: [CU-<id>] <core>`

- `scope` is a functional domain of the system (`sensor`, `comm`, `power`); a file or layer name does not fit. When it does not follow from the material, propose one in the note.
- Insert `[CU-<id>]` when the ID is known; a task not yet created has a title without it.
- `type` follows the project's `cliff.toml`; by default `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`. `!` marks a breaking change.
- `fix` when the code was meant to do X and did it wrong. `feat` when it is to do Y instead of X, also when the old behaviour was a deliberate decision (then often `feat!`).

## Sections

### Goal

1–2 sentences: what problem or need exists today and why this task solves it. In a sequence of slices, one sentence on this slice's place along the path.

### User story

One story: "As a [role], I want [behaviour], so that [benefit]." In Polish: „Jako [rola] chciałbym, aby [zachowanie], co umożliwi mi [korzyść].” The role is an actor from the domain: a user, a therapist, a device, another node of the system, a developer. Behaviour and benefit in domain language ("temperature measurement", "detecting that a node is alive"). One sentence; a longer story carries material for the criteria or the notes.

### Acceptance criteria

A criterion is a present-tense sentence describing an **observable end state**. Tests every criterion passes:

1. **Yes/no question.** The sentence turns into a question "Does …?" / "Is …?" without adding information, and the answer "yes" or "no" can be established.
2. **Observable from outside.** It describes what the recipient sees: a user, a device, another node, a developer running the build. Names of functions, files, threads, configuration options and data structures belong in *Implementation notes*.
3. **Technology as a contract.** A technology, format or interface appears when it is part of the outcome, an external contract: a protocol with another node, a format read by another tool, the platform version the build must run on. Test: would someone outside the implementation notice this technology being swapped for another?
4. **Distinguishing.** The criterion is about this task: it would be false for any other task and is false before this one is done. "The build passes", "tests pass", "docs updated" describe every change; a generic criterion becomes distinguishing when it names the specifics ("The service manual describes the sensor calibration procedure").
5. **Concrete values** when they are the core of the behaviour: period, threshold, test vector, limit.

The `TEST:` marker precedes a criterion that, before the MR is closed, is covered by an automated test run locally and in CI. Put it on key domain behaviours: logic, algorithms, critical states. A criterion checked manually or by review stays unmarked. Flag a `feat` or `fix` task with no `TEST:` at all in the note as a decision to confirm.

Examples, before → after pairs:

- "Communication thread priority set in Kconfig" → to *Implementation notes*; the criterion carries no outcome.
- "The module calls `crc32c()` on the frame buffer" → "TEST: Every heartbeat carries a valid CRC-32C (vector "123456789" → E3069283)".
- "The build works" → removed; not distinguishing.
- "TEST: The frame encoder handles all patterns, and the transmitter rejects a frame while transmitting" → two behaviours, two slices.

### Out of scope

Optional. When the boundary is not obvious, especially in a sequence of slices: behaviours a reader might expect here that other tasks will deliver.

### Implementation notes

Optional. Technical findings from the conversation that the implementer needs and will not easily read from the repository: hardware configuration, platform constraints, design decisions made in the conversation. A bulleted list of findings; the order of steps and the work plan are made during implementation.

### Safety

On by default, conditional: present when the task touches a safety function, a risk control measure or a SOUP item. Names that element and the required verification. When the material does not show whether the task touches anything like that, write it as `To confirm: …` (in the content language, e.g. Polish `Do potwierdzenia: …`) and ask in the note. A project can turn the section off (see *Project conventions*).

### Links

Present only in a regulated project. Read [`REGULATED.md`](REGULATED.md) when:

- the project's CLAUDE.md declares traceability (SLR, SI, SU) or its own list of safety functions or risks,
- the user gave an SLR, SI, SU or risk identifier.

## Project conventions

The project's CLAUDE.md overrides this skill's defaults. It can:

- add sections to the task body; fill them following the convention, giving only known identifiers,
- turn off Conventional Commits or change the title format,
- change the change-size threshold,
- mark the project as not safety-related, which turns off the *Safety* section,
- set the language of the content; without such a convention the content is in the conversation's language.

## Output

In the conversation's language, in this order:

1. **Slices** (only when splitting): a numbered list, a name and one sentence each.
2. **Task title**: one line with prefixes, in a code block.
3. **Description**: a markdown block with `##` headings in this order: Goal, User story, Acceptance criteria, Out of scope, Implementation notes, Safety, Links. Headings are in the content language (Polish: Cel, Historyjka, Kryteria akceptacji, Poza zakresem, Notatki do implementacji, Bezpieczeństwo, Powiązania). Optional sections only when they have content.
4. **Note** (outside the blocks, not for the tracker): the title's check question; when refining an existing task, a short list of what changed and why; numbered decisions to make, with recommendations.

When another skill invoked this one, return only the title, the description and the decisions to make.
