# Changelog for cardano-node

## 1.7.0 -- February 2020

### node changes
- New CLI command to get the node tip (#591)
- Fix the unstructured message output for journald (#590)
- Add structured logging for TxSubmission (#584)
- Add logging detail for TraceForgedInvalidBlock (#605)
- Allow avoiding building the wallet client demo and chairman tool (#597)

### consensus changes
- Split consensus library: generic, byron, mock, testing  (#1651, #1652)
- Internal refactoring to prepare for the hard fork combinator (#1674, #1679)
- Improve use of PRNGs (#1554, #1616, #1678, #1677)
- Simplify the test infrastructure for the volatile DB (#1639, #1680)
- Fix an EBB-related bug (#1690, #1691)
- Fix a bug and improve performance in the chain db adding blocks (#1463, #1709)

### ledger changes
- none

### network changes
- Integrate Windows IOCP-based async I/O, with abstraction layer (#1499)
- Refactoring of the mux, in preparation for bi-directional connections (#1687)
- Trace transaction flow in tx submission for tx system tracing (#1688)
- Fix block fetch bug found by tests (#1147, #1705)
- Introduce ouroboros-network-framework library and rearrange modules (#1655)
- Refactor protocol bundle API (#1655)

## 1.6.0 -- February 2020

### node changes
- Improve node CLI for real protocol vs mock protocols (#297, #314, #318, #335)
- Improve log output for normal block forging and errors (#537)
- Improve log output for normal mempool events (#527, #538)
- Remove redundant `--genesis-hash` flag from `cardano-cli` (#540)
- Move benchmarking CLI commands to their own sub-group (#540)
- Extend tx generator to be able to use the tx submission HTTP API (#549)
- The "live view" now displays the node id (#534)
- Report program version via logging and monitoring system (#542)
- Disable SMP on ARM CPUs due to an RTS ARM SMP bug in GHC 8.6.x (#560)

### consensus changes
- Fix bugs found by tests related to block number handling (#1578, #1584, #1589)
- Better handling of the block number at the genesis (#1585, #1594, #1595, #1597)
- Fix bugs found by other tests (#1543, #1547, #1559, #1562, #1511, #1544)
- Fix bugs found by dual ledger tests (#1608, #1571, #1617, #1577)
- Fix a number of EBB-related bugs (#1620, #1621, #1624, #1625)
- Introduce more sophisticated mempool tests and fix bugs (#1301, #1565, #1599)
- Add tests for unusual changes in wall clock time (#759, #1554, #1601)
- Handle restarting after wall clock time has been moved back (#1550, #1563)
- Use specific program exit codes for node chain db errors (#1201, #1541)
- Revalidate chain db files after unclean shutdown (#1551, #1623, #1304, #1568)
- Add ability to report mempool capacity in tracing (#1509, #1510)
- Add better support for versioned network protocols (#1632)
- Fix minor space leaks (#1602, #1605)

### ledger changes
- Fix rare bug in validation of delegation certs in the mempool (#715, #716)
- Fix a space leak (#717)
- API refactoring (#722)
- Move code from consensus that should be in the ledger library (#676)
- Clean up LovelacePortion representation and API
- Add generic derived JSON instances for downstream users
- Switch to Apache 2.0 license

### network changes
- New NTP client time check library for the wallet (#1327)
- Rearrange and move modules between network libraries (#1561)
- Minor bug fixes in Win32 async I/O code (#1573, #1576)
- Improve `io-sim-classes` support for monad stacks (#1539)

## 1.5.0 -- January 2020

### node changes
- Eliminate a space leak by replacing the Prometheus monitoring backend (#491)
- Change cardano-cli transaction format to be the raw chain format (#529)
- Add checks to prevent space leaks in the node console "live view" (#500)
- Improve bulk sync performance by adjusting default RTS options (#506)
- Adjust the default set of enabled tracers (#494)
- Allow logging output to journald on Linux (#502)
- Show network status information in the the node console "live view" (#493)
- Set PBFT signature threshold to the default value in the config files (#452)
- Blank fields in config files use default values (#453)
- Add tracers for the benchmarking of block forging (#464)
- Remove unused code in the configuration and CLI code (#482)
- Improve documentation of transaction creation (#497)
- Improvements to the benchmarking transaction generator (#505)

### consensus changes
- Implement consensus support for local state query protocol (#1366, #1507)
- Set default mempool size as twice the max block size (#1467, #1468)
- Fix an EBB-related bug in the chain DB iterators (#1435, #1475)
- Correct the implementation PBFT window check to match specification (#1480)
- Correct the size calculation of Byron txs in the mempool (#1535, #1540)
- Improve the node shutdown to close things in the right order (#1470, #1488)
- Optimise adding blocks to the chain DB (#1398)
- Better ledger DB snapshot policy for faster node startup (#1264, #1456, #1518)
- Add conformance testing against ledger executable spec (#1425, #1503, #1517)
- Make the components within the chain DB share a common API (#1372, #1471)
- Refactor consensus protocol type classes (#1527, #1534)
- Internal refactoring (#1497)
- Improve error messages referring to chain DB files (##305, #1529)
- Improvements to test code (#1180, #745, #1479, #1523, #1537)

### ledger changes
- none

### network changes
- Add Windows IOCP-based async I/O for sockets and named pipes (#738, #1423)
- Update to network-3.1 library, and related libraries (#1423)
- Simplify tracing in the typed protocol drivers (#1481)
- Refactor the network mux library (#1494)
- Reorganise ouroboros-network modules (#1519)
- Make the maximum concurrency in block fetch configurable (#1525)
- Improve syncing performance by avoiding concurrent block fetch for now (#1525)

## 1.4.0 -- January 2020

### node changes
- Move configuration of tracers from CLI to the config file (#474)
- Move support for trace forwarding into a logging plugin (#454)
- Make the launcher scripts able to be used with nix, cabal or stack (#458)
- Fix non-liveview mode in shelley-testnet.sh script (#459)
- Elide repeated log messages (#445)
- Simplify cardano-cli interface (#476)
- Remove unneeded cardano-cli dump-hardcoded-genesis subcommand (#451)
- Remove dependency on cardano-ledger-test (#451)
- Remove message counters from config files (#454)
- Add the mempool size metric to the console live view (#457)
- Update scripts and README

### consensus changes
- Limit forged block size based on current limits from the ledger state (#1400, #1363)
- Add ability to get recent ledger states, for local query protocol (#1440, #1446)
- Refactor block forging code (#786, #1445)
- Fix rare bug in block forging (due to unavoidable race condition) (#1437, #1459)
- Fix a case of dubious async exception handling in chain DB (#1452, #1453)
- Additional tests to better cover EBBs in combination with PBFT consensus. (#1353)
- Various tidying up in the consensus QC tests. (#1401)
- Allow disabling assertions for production builds (#1248)
- Add support to get mempool snapshot size for use in system benchmarks (#1431)
- Adjustments to tracing in block forging for system benchmarks (#1432)

### ledger changes
- Relax the validation rule for on-chain registered software versions to better
  match the legacy implementation. This fixes validation of the testnet.

### network changes
- Significant refactoring of network-mux package (#1247)
- Reduce CPU cost of sending over the mux (approx 10%) (#1420, #1434)
- Simplify IOSim's Async representation (#1394)

## 1.3.0 -- January 2020

### node changes
- Update to latest dependencies (consensus, ledger, logging etc)

### consensus changes
- Add initial support for multiple slot lengths (for hard forks) (#282, #1385)
- Do chain selection based only on the latest header in each chain (#1227)
- Significant performance improvements in serving headers and blocks (#1378)
- Snapshot ledger state on shutdown to avoid long restart times (1388)
- Fix garbage collection of previously applied points in the ledger DB (#1381)
- Fix unnecessary memory retention in the volatile DB indices (#1379)

### ledger changes
- Update to latest version of cardano-ledger-specs

### network changes
- None

## 1.2.0 -- December 2019

### node changes
- Update to latest dependencies (consensus, ledger, logging etc)
- More monitoring counters/statistics, including Prometheus output (#366)
- Remove unused legacy and wallet configuration fields (code and confg files)
- Improve README files
- Hide tracing options from default `--help` command
- Fix flakeyness in logging setup & shutdown
- Stop message counter messages from appearing in log files
- Refactor CLI and config parser code.

### consensus changes
- Improve chain sync serving performance by binary streaming of headers (#1330)
- Much more reliable detection of disk corruption in epoch files (#290, #1253)
- Limit the size of forged blocks (#686)
- Change mempool capacity from number of transactions to size in bytes (#974)
- Set node's default mempool capacity to 2x the mainnet block size
- Avoid logging messages about block forging for nodes that do not forge
- Allow starting before genesis start time by waiting, and log message
- Fix a number of bugs related to EBBs, found by QC tests
- Improved the QC test case generators to cover EBBs better
- Fix a memory retention bug and make thunk detection tests pass
- Use file locks for the chain DB (#1266)
- Get the slot length from the genesis file (#1345)

### ledger changes
- Remove support for HD addresses (not needed by the ledger, just wallets)
- Remove unnecessary SafeSigner abstraction
- Remove unnecessary EncryptedSigningKey
- Remove dependency on scrypt
- Add tests for isRedeemAddress, improve address encoding/decoding

### #network changes
- Added initial peer-to-peer governor with QC tests. Not yet used.

## 1.1.0 -- December 2019

### node changes
- Updated to latest consensus and network versions
- Script to connect to mainnet using deployed mainnet relays
- CI integration test for mixed cluster of old cardano-sl nodes and new nodes
- Improved CI "chairman" integration test
- Improved CLI and config file handling
- Adjusted log severity levels for many trace messages
- Better default RTS flags
- New --validate-db flag to revalidate all on-disk database files
- Updated README instructions

### consensus changes
- Adjusted the dividing line between ledger and consensus for block production
  code for clearer structure and so features are tested in the right place.
- Progress on refactoring needed to support the hard fork protocol combinator.
- Serve blocks as binary blobs without deserialising for improved performance.
- Check checksums when reading blocks to detect disk corruption.
- Finish feature to support accepting blocks from the near "future", once the
  local time catches up. This gives a degree of lenience for clock skew, while
  still respecting the Ouroboros rule of "blocks from the future" being invalid.
- Added more extensive QuickCheck tests for BFT consensus.
- Fixed bugs identified by QuickCheck state machine tests.
- Improvements to the API of the IO simulator.
- Trace the reason for a known block being invalid when rejecting a header.
- Add additional trace points.

### network changes
- Simplified API to network layer used by consensus and node clients.
- Documented wire format of the local transaction submission protocol.
- Added infrastructure to support size and time limits in mini-protocol driver.

## 1.0.0 -- November 2019

- Complete rewrite compared to previous cardano-sl series.

- New modular design. The cardano-node is the top level for the node and
  aggregates the other components from other packages: consensus, ledger and
  networking, with configuration, CLI, logging and monitoring.

- The node no longer incorporates wallet or explorer functionality. The wallet
  backend and explorer backend are separate components that run in separate
  external processes that communicate with the node via local IPC.
