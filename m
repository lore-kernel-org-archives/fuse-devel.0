Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E83976AD
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566379; cv=none; b=KV+XRlMae4ZMZeNmgE2lIKnn16ca+w+K/WAKE28VzQusMm3bnU9lgBEoTXx3KSehHoRkx2tU6pT6hV030po0cQFtzuZNPy1H9vv9yr/I/fsZ6zIewjr3Ffq7FFJ7OwCLlTWR9fg14QH/JSJCPu2QPm/KgCqIsueKODOH91+bTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566379; c=relaxed/simple;
	bh=lUig2vIfQIVKtr+oWIxWr+8WGfUwmSMl+URtQk7pJIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hVyTWOLEcvaXMJalJTSItcQXwXIUanZk2poPr+D8jP6Kksl9hv7uvmGfUHMUVxIamZclIO2r5Nl2zGJpvW13XBi4JBIPqUWZlqrylHt1mB6ugbtU2mplewqMr1M16jSswirOkKmB91f5TWPOF2AusJH1X1yiKSRX9/emiCoixro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com; spf=pass smtp.mailfrom=birthelmer.com; dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b=W7I1m4zB; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birthelmer.com header.i=@birthelmer.com header.b="W7I1m4zB"
Received: from fedora.fritz.box (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id C51B9E02EE;
	Thu,  4 Jun 2026 11:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=birthelmer.com;
	s=uddkim-202310; t=1780566369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=939WDVUDtPOc73uBVHbOs1OZu9OadPcXukcjgRF11LI=;
	b=W7I1m4zBYcG+1gtGMHy91f4jdhXBTGgd+330vZz+0rkDRmjacnUdPPUxWz4SFbPMsvrGMw
	WPYDah0ob1mCxqCnxrpFi07YPLkZDOfZcBkhEl34BGWOtpHYem9L8pVwkwN6K7ApoPAMaL
	x3TeO4HwfAO50G1fjgr9FnsI6uhzACu/qcHtdE13Kua1ho+dEyFiQwVdjofqmX6KxutUgo
	oBas3yYyfsc+8O2aPctxwHPc40byjoAV+D8I49QON4PPqXK6HHDi95x7erpVJTpbNU28gG
	4sY9flZ9X0z33zVfQUCogRKG4kdFSxrylMU62WM1zAQvUyT6XGotkeqRRbwyEA==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.com
From: Horst Birthelmer <horst@birthelmer.com>
Subject: [PATCH v7 0/4] fuse: compound commands
Date: Thu, 04 Jun 2026 11:45:41 +0200
Message-Id: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PO27DMAwG4KsEmqtCop7O1HsUHfSgGg2xDSk2E
 gS+e+UAReLBaMefID+Sd1KxZKzkeLiTgnOueehbMG8HEk6u/0aaY8sEGCgOIGiaKtIwnMdh6mO
 l01gvBd2ZBqu8RNF5EQVp02PBlK8P+fOr5VOul6HcHotmvlb/NmdOGTXeRdRadNL4jxj799ZIV
 nGGfyrQFJaMl1LxdiZuFfGraMaZ3VdEU2wMHUefhJFsq8hXpdtX5HpLFN6Ck1rrtFXUUwHO9hX
 VFHRMWZU0ROe2in5RQO8rev2oGUGlECGFp7Isyw9NF+WOGgIAAA==
X-Change-ID: 20251223-fuse-compounds-upstream-c85b4e39b3d3
To: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: linux-kernel@vger.kernel.org, fuse-devel@lists.linux.dev, 
 Horst Birthelmer <hbirthelmer@ddn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780566367; l=4999;
 i=hbirthelmer@ddn.com; s=20251006; h=from:subject:message-id;
 bh=lUig2vIfQIVKtr+oWIxWr+8WGfUwmSMl+URtQk7pJIw=;
 b=mp87QgZjyhI5y/A83XWmVmw2GeAUXy0TwHs9mZ2jGAvShi/gPbqIRl1yCmUt7Rtgxj0ePOogf
 A0PLb0NInZBAw8feuHOIoPevQAIryyzLZ+/KWxf8GIj65ckieAqnVqK
X-Developer-Key: i=hbirthelmer@ddn.com; a=ed25519;
 pk=v3BVDFoy16EzgHZ23ObqW+kbpURtjrwxgKu8YNDKjGg=

This series adds a single new opcode, FUSE_COMPOUND, that bundles a
sequence of subrequests into one round trip.  The wire format is

    fuse_in_header (opcode FUSE_COMPOUND)
    fuse_compound_in
      fuse_compound_req_in
      fuse_in_header
      payload
      ... (repeated per subop)

Compound is opt-in per connection and discovered by trial: the kernel
assumes support and clears its flag on the first -ENOSYS reply.
-EOPNOTSUPP declines a specific combination without disabling the
feature.  In both cases the kernel replays the subops individually
via fuse_simple_request(), so callers never need a separate
non-compound code path.

The series ships two consumers:

  - open + getattr, used when fuse_file_open() needs both ff->fh and
    fresh attrs (O_APPEND, or cached attrs already stale).  This
    closes the open-then-stat race described in [1].
  - dentry revalidate, fusing LOOKUP + GETATTR when both the entry
    and the attribute caches are stale.

The matching libfuse pull request is here [2].  It contains a helper
that decodes a compound and runs each subop in turn, plus a
passthrough_hp patch demonstrating both that path and the
alternative of handling the compound entirely server-side.

Compounds were reccently discussed more of a thing for fusex 
but I think we should add them to the 'classic' FUSE as well, 
and as long as fusex hasn't landed and the full fuse channels 
are not here, we could add these here.

[1] https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/
[2] https://github.com/libfuse/libfuse/pull/1418

Signed-off-by: Horst Birthelmer <hbirthelmer@ddn.com>
---
Changes in v7:
- simplify fuse_open_args_fill() handling
- share result handling between the open+getattr compound and the old code
- send open+getattr only when the attributes we have are expired
or we have open flag O_APPEND
- remove fuse_compound_alloc()/fuse_compound_free()
- add small header for every request in a compound to send compound flags
to fuse server
- Link to v6: https://lore.kernel.org/r/20260226-fuse-compounds-upstream-v6-0-8585c5fcd2fc@ddn.com

Changes in v6:
- got rid of the count in the compound header
- added the automatic calling of the combined request if the fuse
server doesn't process the compound and the implementation allows it
- due to the variable max operations in the compounds request struct
fuse_compound_free() had be brought back
- Link to v5: https://lore.kernel.org/r/20260210-fuse-compounds-upstream-v5-0-ea0585f62daa@ddn.com

Changes in v5:
- introduced the flag FUSE_COMPOUND_SEPARABLE as discussed here
- simplify result parsing and streamline the code
- simplify the result and error handling for open+getattr
- fixed a couple of issues pointed out by Joanne
- Link to v4: https://lore.kernel.org/r/20260109-fuse-compounds-upstream-v4-0-0d3b82a4666f@ddn.com

Changes in v4:
- removed RFC
- removed the unnecessary 'parsed' variable in fuse_compound_req, since
  we parse the result only once
- reordered the patches about the helper functions to fill in the fuse
  args for open and getattr calls
- Link to v3: https://lore.kernel.org/r/20260108-fuse-compounds-upstream-v3-0-8dc91ebf3740@ddn.com

Changes in v3:
- simplified the data handling for compound commands
- remove the validating functionality, since it was only a helper for
  development
- remove fuse_compound_request() and use fuse_simple_request()
- add helper functions for creating args for open and attr
- use the newly createn helper functions for arg creation for open and
  getattr
- Link to v2: https://lore.kernel.org/r/20251223-fuse-compounds-upstream-v2-0-0f7b4451c85e@ddn.com

Changes in v2:
- fixed issues with error handling in the compounds as well as in the
  open+getattr
- Link to v1: https://lore.kernel.org/r/20251223-fuse-compounds-upstream-v1-0-7bade663947b@ddn.com

---
Horst Birthelmer (4):
      fuse: add compound command to combine multiple requests
      fuse: create helper functions for filling in fuse args for open and getattr
      fuse: add an implementation of open+getattr
      fuse: add compound command for dentry revalidation

 fs/fuse/Makefile          |   2 +-
 fs/fuse/compound.c        | 126 ++++++++++++++++++++++++++++
 fs/fuse/dev.c             | 206 +++++++++++++++++++++++++++++++++++++++++++---
 fs/fuse/dev_uring.c       |  31 ++++++-
 fs/fuse/dir.c             | 139 ++++++++++++++++++++++++++++---
 fs/fuse/file.c            | 115 +++++++++++++++++++++-----
 fs/fuse/fuse_dev_i.h      |   5 ++
 fs/fuse/fuse_i.h          |  39 +++++++++
 fs/fuse/inode.c           |   9 ++
 fs/fuse/ioctl.c           |   2 +-
 include/uapi/linux/fuse.h |  56 +++++++++++++
 11 files changed, 685 insertions(+), 45 deletions(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20251223-fuse-compounds-upstream-c85b4e39b3d3

Best regards,
-- 
Horst Birthelmer <hbirthelmer@ddn.com>

