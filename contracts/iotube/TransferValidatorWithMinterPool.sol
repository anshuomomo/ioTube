pragma solidity <6.0 >=0.4.24;

import "./MinterPool.sol";
import "./TransferValidatorBase.sol";

contract TransferValidatorWithMinterPool is TransferValidatorBase {
    MinterPool public pool;

    constructor(uint256 _expireHeight, address _minterPool) public {
        pool = MinterPool(_minterPool);
        setExpireHeight(_expireHeight);
    }

    function withdrawToken(address _token, address _to, uint256 _amount) internal returns(bool) {
        return pool.mint(_token, _to, _amount);
    }

    function upgrade(address _newValidator) public onlyOwner {
        pool.transferOwnership(_newValidator);
    }
}