export type Greeting = {
  message: string;
};

export function greet(name: string): Greeting {
  const trimmedName = name.trim();

  if (trimmedName.length === 0) {
    throw new Error('name must not be empty');
  }

  return { message: `Hello, ${trimmedName}!` };
}
