const _sodium = require('libsodium-wrappers');
(async() => {
    try {
	await _sodium.ready;
	const sodium = _sodium;
	var buf = sodium.randombytes_buf(16);
	var str = sodium.to_hex(buf);
	console.log(str);
    }
    catch(error) {
	console.error(error);
    }
})();
