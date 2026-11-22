Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354165;
	b=Sm6ClfjtWXlCiEyNqawQ/kjzyA6a26EQyhTgiFoofkeb5xot9PbaAUvFutfmpqYekjw9
	 p8y0arhhcHKXkjBuRnL+ra9aPL3UXEdg+O+mumY7nCrf6Fb8LM/xMsPzc6dU87farwA1Q
	 hc44NP3vDVd+NLmrGb8MBB/ZMvP139xb3zYc95FhdtyAVY/UahtMe71E/QukmMI0PDamj
	 vabU34RSe1j4kWLsPIu414FxYkYD3sjE1/rQ3aFwYLmFubPvVfDMjBPRfc16dPWNtwLET
	 LOzNYH6Z3/7HjkKA9QVCsozP/oEt2J1DYQ2suBw4WuJIqMhu1s5bnonTynRryi/3wHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zrwb4vi9srdED9D8xOIdzaIRX8YSIZGStNuuSHb2U2Q=;
	b=G+3RHVf1+sBd7s6vYAbjqMfwkIr/rsUt8GnZnm42bBO/EEo9e6wkkhBJS2NRWyR2vfKB
	 dENer1kx5U4qU/UMeNMCcVJB3RXbfUmLKPl4DepDCizsjkJUukmFmSHtJGbpIer+//EVt
	 IX6d1CstKuqMPQOBJcnbj/QCDR9UxLN/53KSSDdQ+6yG/AETwAespMsfa5vPvAypv5puH
	 +MAAVVzMc92JFq2EpmovZanAslZ1iOOuW1+Wn7CjT2WfYeSJOpPvaKfpZCQvgl8o4P3PJ
	 ySlh0H+EyY8AxHKMwu27wTw26hOt7ykUUvmhvj0gf2gHr1U1rIrTwIw05cVJK0Gz6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeOR9Qki;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A4606A320
	for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 13:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeOR9Qki
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so1677067f8f.0
        for <fuse-devel@lists.linux.dev>; Sun, 22 Nov 2026 05:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354163; x=1795958963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zrwb4vi9srdED9D8xOIdzaIRX8YSIZGStNuuSHb2U2Q=;
        b=ZeOR9QkiGTn9qZgkklKiBWR7nii59VvkCWv8hcTFx6gkE81lFAxDpn0IcCXJFGCwm4
         ozAZ3cCThekpxpEhz8De4ewz5vHptJuXLB8A5noF/dGLvA88QRLyQt+cFbYkcE8aewOh
         xiEbajDfi4EMTRVmDkrLF8nK5dlEM2L6MIEZo6+vteqGNww2OVlpV+sCl3EBI6DLtcBJ
         dhXgXQKtA2YxT72ipfy+L+ytaPxrVSBISArSz2H7ErzFzEx9DJ2+zhZf03X65m97C7x1
         en1lvYWb8nUvyCqFuNGhJMqlzSqgm/dWPUHG7d/iTVin0jnDIrs0+f5zgout7GFyyszQ
         nkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354163; x=1795958963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zrwb4vi9srdED9D8xOIdzaIRX8YSIZGStNuuSHb2U2Q=;
        b=nUqtm+h5ZKDG9ynKwiYZqOubWl4zY/Bxnzcl+RZoHomeUTWmlovNfgGc4loWriPFeR
         DBCFyKBR2Q+CbMSzyFyaKF0fsOtiP/Yhh4dDoEh/rmxwRlCxXoNfpQojX2Nd6Eew/N6m
         AwwVe8XS4IRw6uwWSHfy4tFrf9pfjPPOInYWLq6ebt+kOY8VUWHYUq9HuOQBrJRXm2xi
         bTlPfoYxkIkKmqkusZO/UnuJNIyG+YC+E4yWvkhmCjWc6a/KaZNFe1WQBzcG9i08ZPXD
         Uqk0z/eceqgpENmJRhJpcC/19XZdbU0LDg2sGms7Sxzggp3P7gOIjAEaXNKxaiRaUNVK
         S53g==
X-Gm-Message-State: APuU4Z80FISgvLkDhDmtYovCFoc0MpX6BIg+pi5ZXtDENyn0cr/s3ym1
	TA+c5FCmT+i3auIpCw4PJhJlTZADQ0QmKSpP6PH+rGlpBG2oRPlZzR/K
X-Gm-Gg: AZFdTZeISptFDk9R0adPTdys99wZYEmDtdUDGU0QaqyWEzPIxMM+Dr9qEBiY7JciDOR
	E/w2JXalJjdCRmL6jbIjpSI9/8d98J3uo2Ku32qIiDi4mrzR6FQzf3HCwtfJLc2kwoTHWVrX+ms
	C5+LPO90ObsaxY6cX1qf7xpwn39DXMjzXX4LzZWJ9yt+AQdp3v9+Mz71aqTqKPWC54DGkpyFW0P
	Zc3BJTQPUjYLxmF701EKQ2IKDU++rMtcyI7/9KN64JZKAiDU7PavuwGv6qMeUDd9O36mjgqZ2rY
	tKownhS67gRVUb99wtSi+3hAfSMd9azIXjipOCQceguY/d3OKzpKjDEHthebPFTaJHvNeFeDZZM
	3cBPC/Idz5ZS3LOqzHuK2WADiI2WVHCAvcB0UyWoD+a119BTXg4DCaszVw7p52oO4JLEqEJgGir
	KMNFhyulkgklyt29paPZWUG9t5BWizUDdWOq0fSHY9AhN9wBANuhhTjb9m1zFhLKA9opABdH2y3
	qCE97Kp0+o3DWhwZW9HlpCfLIUrhbptPVAVdyY+RQU6PVqZbUTC8rfQqjZ3IxQItOugtW6j9Nrg
	r3V7P9opeTdRjeL1iKiLYUb4aSubza4SLi8PGohtrB+WfmIJXIiD3IGiJPIYgXtd
X-Received: by 2002:a05:6000:188a:b0:4a4:da59:aa60 with SMTP id ffacd0b85a97d-4abab4f5aaamr17925749f8f.3.1795354162889;
        Sun, 22 Nov 2026 05:29:22 -0800 (PST)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm17286017f8f.16.2026.11.22.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:29:22 -0800 (PST)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: amir73il@gmail.com,
	miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-fsdevel@lists.linux.dev,
	mmitar@gmail.com,
	bernd@bsbernd.com,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] fuse: kill suid/sgid on fallocate, copy_file_range and passthrough writes with KILLPRIV_V2
Date: Sun, 22 Nov 2026 14:29:13 +0100
Message-ID: <20261122132916.19066-1-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With FUSE_HANDLE_KILLPRIV_V2, an unprivileged fallocate(),
copy_file_range() or passthrough write leaves the suid/sgid bits set,
because the kernel never asks the server to clear them. Mitar reported
this in [1], and Bernd posted a fix in [2].

Patch 1 is Bernd's fix, rebased on the most recent pull of FUSE
fixes[3] in Linus' tree, otherwise unchanged.

Patch 2 bumps the FUSE protocol minor version to 48, so a server can
tell whether the kernel has the fix before it asks for
FUSE_HANDLE_KILLPRIV_V2.

Patch 3 adds a selftest. It runs a raw /dev/fuse server and checks
which kill requests reach it.

I messed up my email sending just now, leaving out the self-test patch, so trying it again.

[1] https://lore.kernel.org/fuse-devel/CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com/
[2] https://lore.kernel.org/fuse-devel/e75cf549-07a6-4095-bbf8-8caff7a3338b@bsbernd.com/
[3] https://lore.kernel.org/fuse-devel/179520930874.792202.7768867709024262369.pr-tracker-bot@kernel.org/

Bernd Schubert (1):
  fuse: kill suid/sgid on fallocate and copy_file_range with KILLPRIV_V2

Han-Wen Nienhuys (2):
  fuse: bump protocol minor version to 48
  selftests/fuse: test FATTR_KILL_SUIDGID from file_remove_privs()

 fs/fuse/dir.c                                 |  13 +-
 fs/fuse/file.c                                |   3 +-
 fs/fuse/fuse_i.h                              |   2 +-
 include/uapi/linux/fuse.h                     |   6 +-
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../filesystems/fuse/killpriv_v2_test.c       | 359 ++++++++++++++++++
 7 files changed, 381 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/killpriv_v2_test.c

-- 
2.56.1

