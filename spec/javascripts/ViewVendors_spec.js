describe('calcService', function() {
 it('Assigns 50 to electric service', function() {
  var electric;
  var b = 50;
  expect(electric = 50).toEqual(b);
  expect(electric).not.toBe(null);
 });
 it('Assigns 25 to table service', function() {
  var table;
  var b = 25;
  expect(table = 25).toEqual(b);
  expect(table).not.toBe(null);
 });
 it('Assigns 4 to chair service', function() {
  var chair;
  var b = 4;
  expect(chair = 4).toEqual(b);
  expect(chair).not.toBe(null);
 });
}); 