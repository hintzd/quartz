export function pluralize(count: number, s: string): string {
  if (count === 1) {
    return `1 ${s}`
  } else {
    return `${count} ${s}s`
  }
}

export function capitalize(s: string): string {
  return s.substring(0, 1).toUpperCase() + s.substring(1)
}

// Add the classNames function (added for OverlayExplorer component)
export function classNames(...classes: (string | false | null | undefined)[]): string {
  return classes.filter(Boolean).join(' ');
}
