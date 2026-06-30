## [1.1.1]
- Update `concurrent-ruby` to `1.3.7` to address CVE-2026-54906 (ReadWriteLock unauthorized lock release, CRITICAL) and CVE-2026-54904 (AtomicReference#update infinite loop, HIGH).
## [1.1.0]
- Fix gemspec conditional so grape-entity resolves to 1.x (the Rails-version guard never loaded under Bundler).
- Bump grape-entity constraint to `~> 1.1.0`.
- Update bundled dependencies to resolve activesupport (CVE-2026-33176) and uri (CVE-2025-61594) advisories.
## [1.0.6]
- Lock grape-entity version to 1.0.1.
- Update CI to use Ruby 3.4.5.
## [1.0.5]
- Allow to set custom serializer_class.
## [1.0.4]
- Add MIT License.
## [1.0.3]
- Change default total_pages for list_entity from 0 to 0 or 1.
## [1.0.2] / [1.0.1] / [1.0.0]
- Update preload for rails 7.
- Allow to access options in serializer.
## [0.1.2] - 2023-05-18
- Add gitlab templates.
- Update gemspec.
## [0.1.1] - 2023-04-12
- Support `options[:service_name]` to use custom service name in ServiceEntity