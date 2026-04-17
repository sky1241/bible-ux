# States coverage checklist

> Every screen must cover these 8 states. Missing any one = polish gap.

For each screen you design, implement, or audit, verify:

- [ ] **Default state** — happy path, data present, everything nominal
- [ ] **Loading state** — skeleton matching final layout (1 s – 3 s) OR spinner (100 ms – 1 s). NEVER blank white screen. See [VALUES.md § Loading thresholds](../../VALUES.md#loading-thresholds-jakob-nielsen).
- [ ] **Empty state (first use)** — user has not yet created any data. Illustration + title + description + primary CTA. Encouraging tone. See WEB § V · MOBILE § Q.
- [ ] **No-results state** — user searched/filtered, got 0 hits. "No results for 'X'" + suggestions + clear filters. Factual tone (not blaming). See WEB § Q.
- [ ] **Error state (recoverable)** — network failed, server 500. Message + Retry button. Preserve user input. Inline for local errors, banner for global. See WEB § A3 · MOBILE § BX.
- [ ] **Offline state** — no connection. Persistent banner + queue pending actions + auto-retry. See WEB § R · MOBILE § O.
- [ ] **Success feedback** — action completed non-trivially. Toast 3–4 s OR inline confirmation OR micro-celebration for milestones. See WEB § A4.
- [ ] **Disabled / permission-gated state** — action unavailable in this context. Explain WHY + how to enable. Not just grayed out. See WEB § A5.

## Framework-specific

### React / Web
```jsx
// At minimum, every component has these branches
if (loading) return <Skeleton />;
if (error)   return <ErrorView onRetry={retry} />;
if (!data)   return <EmptyState onCreate={create} />;
if (data.length === 0 && hasFilters) return <NoResultsState onClear={clearFilters} />;
return <DefaultView data={data} />;
```

### SwiftUI
```swift
ZStack {
    switch viewModel.state {
    case .loading: SkeletonView()
    case .empty:   EmptyStateView(onCreate: viewModel.create)
    case .error(let err): ErrorView(error: err, onRetry: viewModel.retry)
    case .loaded(let data) where data.isEmpty && hasFilters:
        NoResultsView(onClear: viewModel.clearFilters)
    case .loaded(let data):
        DefaultView(data: data)
    }
}
```

### Compose
```kotlin
when (val state = uiState) {
    is UiState.Loading -> SkeletonScreen()
    is UiState.Empty -> EmptyState(onCreate = onCreate)
    is UiState.Error -> ErrorScreen(error = state.throwable, onRetry = onRetry)
    is UiState.NoResults -> NoResultsScreen(onClear = onClear)
    is UiState.Loaded -> DefaultScreen(data = state.data)
}
```

## Anti-patterns

- ❌ Render `null` or `false` when data missing — user sees blank screen
- ❌ Generic "Error" message with no action — dead end
- ❌ Same empty state for "first use" AND "no results" — different tones required
- ❌ Silent offline (user thinks the app is broken)
- ❌ Success confetti on every save — reserve for milestones
- ❌ Disabled button with no explanation — user wonders "why can't I?"

## Minimum polish tax

Every screen pays 7 states × ~10 min = ~70 min of extra work. That's the "looks amateur" vs "looks professional" boundary.
