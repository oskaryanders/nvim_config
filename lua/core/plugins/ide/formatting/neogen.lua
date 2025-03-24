return {
  'danymat/neogen',
  opts = {
    config = true,
    languages = {
      lua = {
        template = {
          annotation_convention = 'emmylua',
        },
      },
      python = {
        template = {
          --annotation_convention = 'google_docstrings',
          -- annotation_convention = 'numpydoc',
          annotation_convention = 'reST',
          reST = {
            { nil, '"""Method which TODO:' },
            { nil, '' },
            { 'parameters', ':param %s: TODO:' },
            { nil, ':return: TODO:' },
            { nil, '"""' },
          },
        },
      },
    },
  },
}
