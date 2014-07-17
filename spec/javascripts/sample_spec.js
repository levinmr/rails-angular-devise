'use strict';

// spec/javascripts/sample_spec.js

describe('RegExp', function(){
  it('should match', function(){
    expect('string').toMatch(new RegExp('^string$'));
  });
});
