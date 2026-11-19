# Regulated project

Part of the [`task-description`](SKILL.md) skill for projects that require traceability (e.g. under IEC 62304) or keep their own list of safety functions and risks. It extends the *Links* and *Safety* sections; the project's convention (identifiers, placeholders, format) overrides this file.

## Links

One line in the description:

`SLR: <id> · SI: <id> · SU: <id>`

- **SLR** (System Level Requirement): the system requirement the task derives from. Always present.
- **SI** (Software Item): the software item, when the change concerns a whole module or component.
- **SU** (Software Unit): the software unit, when the change concerns a separate unit inside a module.
- SI and SU together when the task creates a new SU in an existing SI.

Identifiers:

- Write only identifiers given by the user or read from the repository or the tracker.
- Record a missing identifier of an existing element as `?` and ask about it in the note. Such a traceability gap stays visible in the content until someone closes it.
- An element the task is only creating gets a placeholder from the project's convention (e.g. `PRJ-SU-????`). The number is assigned during implementation, following the project's rules.

Several SUs in one task are a size signal, like several domains: check that the task carries one slice.

## Safety

The section names what the task touches and the required verification:

- **Safety function** or **risk control measure**: name and identifier from the project's risk analysis (when the project keeps one), and the impact of the change (new measure, change to an existing one, change to its surroundings).
- **SOUP item**: a new external library or a version change of an existing one. Name, version, reason for the choice. A new SOUP item needs an assessment and an entry on the project's SOUP list before it reaches the code.
- **Verification**: the kind (unit test, integration test on hardware, review, analysis) and what exactly it must confirm. A risk control measure gets verification of its effectiveness, not only of its presence.

When the project keeps a list of safety functions or risks, compare the affected area against it before deciding that the task does not touch safety.
