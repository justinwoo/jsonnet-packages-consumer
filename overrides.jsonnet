local upstream = import 'packages.jsonnet';

upstream {
  'simple-json': upstream['simple-json'] { version: 'override' },
}
