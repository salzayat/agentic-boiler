import assert from 'node:assert/strict';
import test from 'node:test';
import { greet } from './index.ts';

test('greets a named person', () => {
  assert.deepEqual(greet(' Ada '), { message: 'Hello, Ada!' });
});

test('rejects an empty name', () => {
  assert.throws(() => greet('  '), /name must not be empty/);
});
