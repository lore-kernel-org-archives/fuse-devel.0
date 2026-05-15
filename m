Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D63CF03E
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 04:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821014; cv=none; b=cMBD9ZeKzMNJJfcbXdaVhz/2jIIYRHnFeBmA0VW1HxLLb/in1WE4jMJh7gr/S25PaTayKuBnMwc54gsf0hWc2kiOxVT9H7nIbR8ihwua1zeyIyGSm6J+hiocyqEeAqMwACq1ylDoYqA6eYgn9ypbYHqgIw0edXLu1xcz2a6+suc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821014; c=relaxed/simple;
	bh=pyL/d6qXjW11L8m0+cTiNPjd3o8LILqk51BS4XW6+3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RzXbkdiWQ9NOjRCEIFolLOzKeNllqtOkVlogzF6epX4WjV6ToNh2CjJCgmtWWXbN5zWVVzVjNBBRl9doH3YUtwU3n/nGPGsYf692HNrpQW0VrmB4BovJjyL5aK2PTRJUY0VEuHDMxqZf/Is/q9N3D5Ee5NgllmOdZ/Lo8LXqTPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8uoZvPp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8uoZvPp"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-839dc688d6cso3580279b3a.2
        for <fuse-devel@lists.linux.dev>; Thu, 14 May 2026 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778821012; x=1779425812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvPsW3+pk3TgPg7LATQ1Ys+0Eg4SYoKzW5pQWByFv3Q=;
        b=P8uoZvPpi4HKoNqEgRZ6+v8+nVg2SG9lX5Nmfe0aoxrpRdEdswIASkHRdx7kezzDtu
         8iOqOY0n0qYXm3F3Tag34XZY8kQLbnzNcbzY5wkyNHh45dEX9fIjuxjvV2lnFvUv8UIf
         PpmMtz6AdGxBoNBvyWP9zqdVa38HTaYSVJOFI2AtYyiNvD4d2sIaxyN6AZDw3/g8wnga
         TByueKqoR+8NJgSI4JAAXDnKdW2I0nh6Ob8VAIPflO6AJSX7clrvMipjcL0Dtmhi1jsd
         n8QGaplRrtK0kOmwoXw70Jd4nxW22BYZXaOHramcyZEN/dkpc1bLBns+DVD0rzbUPliD
         OCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778821012; x=1779425812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvPsW3+pk3TgPg7LATQ1Ys+0Eg4SYoKzW5pQWByFv3Q=;
        b=V7QpokLHsJcMEkQwuM0He73TAs36ClIY2YkV0mg0kc4ZrkuyQlcEKTJwXb1zd3iA9T
         TtHcM/CQngPy5hs+xGHSMI2cuFCk+/QmB/+vl5wPtRiJxZqzUfdVvRmQcy1SuQZ/Ioqd
         9obU6dOrMndkGB16h+CIZSEfuGlgLgWj29y+Kk/Knf81beRoZgAQIECM3L/qcHPV29Cx
         ZeS/7Gd3ef2WYRafn1ReqVI5NXoIgwqxIGNO6KuKjJNflu8cGvCdU3bSDfe/A5NFVVNt
         ZaAdMykcVbKXMFaA7lTCp7+CQEFEN3xbiS/jjZEov5Zj4fTjv07hus9wOlK69kWUToWX
         Ii7Q==
X-Gm-Message-State: AOJu0YxqSwsiPfy41L/XrLA1LQlBMViSeShCct3idEQC2ZA44Hu/IeD/
	AHJgcT6XkyekowdhII9pFN8b2zFSo4Wdmgj5pwRSE/fT4U21Dq67Hhz6su5KMQ==
X-Gm-Gg: Acq92OHnbC9jlhr4BgHWeIEvPqs+8vcCno6oSOP9553QlKPvBXE4Kds4+DGfJxQw1//
	B3v6Qg7hkW41rRp03kTOC3osio4QudGgnAkVSzv4n87zhQ0oYpsPKIyIlipEAWvj3B/oAh9XkU8
	BhFFbJsGjJ66pb6dhRdbUGMi5JuizY9/4+useeDwv7xZvqpZGRLv9JaeH1KwfbQAfQ9dWVQiNEE
	l3ONec4WhfjH+mgxvEKUp7RkdhU/o75TNvCYc/hfMklmkj7N0oh8XrzqjF3EIn0ZmyTZPL0dYH1
	mDb4K5wm4plhfHaL3P1eili6Dp9V6IOs5tVQEJUtyHYJpm60CsuDSutsZyZetsrn6/He24LEh8r
	JkMPfDPNIb322lTKK1OAofJeqHfbxgTlW3j6FzYZwTM8qxsumTkYqhYv8jU7CV7KvpFRfFSyZzi
	bNowFIf9TvHye52y6ehwkW
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr2526981b3a.34.1778821012082;
        Thu, 14 May 2026 21:56:52 -0700 (PDT)
Received: from localhost ([2a03:2880:f80c:2a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664220sm4184963b3a.4.2026.05.14.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:56:51 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	bernd@bsbernd.com,
	ali@ddn.com,
	horst@birthelmer.de
Subject: [PATCH v1 0/3] fuse: fix io-uring abort races and cancel null deref
Date: Thu, 14 May 2026 21:55:38 -0700
Message-ID: <20260515045541.1171335-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches 1 and 2 fix races between fuse uring ring creation and abort and
registration and abort that can result in indefinite hangs during unmount and
leaked resources.

Patch 3 fixes fuse_uring_cancel() moving cancelled entries (which have no
fuse_req) to ent_in_userspace, which can crash ent_list_request_expired().
It also removes the queue_refs > 0 gate in fuse_uring_abort() so that
request flushing always happens, since cancel now decrements queue_refs
directly.

[1] https://lore.kernel.org/linux-fsdevel/adiiTGjP1tqZfIrI@fedora/

Joanne Koong (3):
  fuse: fix race between ring creation and connection abortion
  fuse: fix race between registration and connection abortion
  fuse: fix moving cancelled entry to ent_in_userspace list

 fs/fuse/dev_uring.c   | 32 ++++++++++++++++++++++++--------
 fs/fuse/dev_uring_i.h |  6 +++---
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.52.0

