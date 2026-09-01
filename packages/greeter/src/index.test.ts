import assert from 'node:assert/strict';
import test from 'node:test';
import { announce } from './index.ts';

// TEMPLATE:REPLACE this fixture together with the composition example implementation.

test('announces a named person for an occasion', () => {
  assert.deepEqual(announce(' Ada ', ' the launch '), {
    message: 'Hello, Ada! Welcome to the launch.',
  });
});

test('rejects an empty occasion', () => {
  assert.throws(() => announce('Ada', '  '), /occasion must not be empty/);
});
