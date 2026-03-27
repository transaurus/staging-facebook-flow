(*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

include
  FlowServerMonitorConnection.CONNECTION
    with type in_message := ServerCommandWithContext.t
     and type out_message := MonitorProt.monitor_to_client_message
