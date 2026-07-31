Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673FE42464E
	for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499436; cv=none; b=LoLJlpFTL2t7CM/jgt5UnUeDFfJnWnZzPl8P6Nm9JRzbL/guabUr82Zhpg34p6tOF9YcaNVDczkgOSRdPUG3tTH1s4/uEjIN794NgHqf4TGz8igdmfVZJxhhEd8dBP93tFxs5t5cAb9rGxYdo2WXzCYtTW4oSuzhqJ2LVXS8Nfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499436; c=relaxed/simple;
	bh=a3u47kRr3Do278tdnqPPYoZAssH2IdMcqqRKQFentd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsWsl4NYzu6pS18jju6LvKMm54rB1Bw9Z1ZblNny4i6LVlEo36soeIaIiQngZiF7g+uH4Ty5Eq+NETmuFr91pjnPehjrVu3Vs3MPH9R8UOFCZxN5n4mq55dZdi4YY1Joiv7yJQ2mca2sh0Tu6W6PAr8ASIY4P4ew+AP4qqzA5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=IRr5GaMX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="IRr5GaMX"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ff20870ac7so6066286d6.1
        for <fuse-devel@lists.linux.dev>; Fri, 31 Jul 2026 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1785499434; x=1786104234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzP4sK4hBb/8A2cn+zbTFn82mSE4pQ11vgzpnhcOkCA=;
        b=IRr5GaMXG6/hxjNFyAVRxfnbhUYRhPuk1BPIiSoLR5wDvzABZnCR/C+hPTzkLLNc0r
         gxNqYvqYpxBTttdZIe6T9XVUjUUotuo8I/TQqMXu1bOxFE7qdxkvdWTyDaJJaNIoX5ir
         Zt+baRobI6dYXLVI83JHh4foQsd0MWgneyVCbUX0i6knGvWzUYesIuLHn+i7ns1lWzyV
         cndImK94k2ImrJqbo+JHumW5T7nixPJfPJMix6drm0d2SuThwxuWBmo2OBM1AR6REwwN
         PUfJq21qv31f0J6oZha89I7i5JLeo0wtvPoO86LoAsiqXc4mNe5tktUBG5VqgfL0xlsq
         prvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499434; x=1786104234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzP4sK4hBb/8A2cn+zbTFn82mSE4pQ11vgzpnhcOkCA=;
        b=ELfgCrApygtrQgWHIcyZoXMz7QiWoSO8sSzbIuHNqKMAh5L8+OYMjmoHAQrWjCYLeD
         VJvW6SvIzUTKqVv9qDOBvREPtP5laPjdtuGYJDcImIrrgDtoOTiPHQ24T5WE8VwPmXuL
         BA7hyKf1GyBM2+eyJCb/xAfp0cJZN5kzuDCStpVI0eJ8OyeIdZUfjlxfVnCfBFz1e5HR
         szp1NVrgvyOHDfCixwQ/IIUaR37xgfHgm4mwqSoEyJP2UNwlBsulutrDJn/7OLwRWWIY
         7O72HDTtHUErsypd0S1ve556n0gis/egMLcNKW6zv96Ikek1vTv4yQzIUWPfaGCkWpr8
         ARGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7QnfgPwwFB4UVR3D9KU6/k7H5XZn/ZG6HAgvgAdkJ1unCWJva8p7tDwn5AbhmEtGg+k7tUZ41lpEo@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Jx+MyL6bePXHZPesdMYhOJvwkyYaSo0QfI1B+5W6fFnx+XGq
	oeWipnxV/j1APzdlYvKSZ3rZnCvkyBqQk6AznF0gzNkoW0odyNah+PMyx8E4c/vUfAc=
X-Gm-Gg: AR+sD10UufEwXCb7WGlWdLegSm6GZMzv4D1ItzWmawWF5+n8Oe+SCHjPXgfVjY8q5pQ
	W4K+VE56d4kVKVqsYRz0mdWkA88pt2JS5xnIsCgrr5PQbtpBujh1qQZEiKlwL3H8FSQsC7F4LaN
	jaA0Ibh5tpaFXXFcOyMTl8tuBO2fUdpKvVYN1sSUcWV0Akjk2A0RatWeX6/O0k4TEuIlg53uL/b
	u8n03/TuZaVsii8AbgVMaaWrEZMWG8VktXShXlX8dKNfy6xsy3N1rQxaHNsYDjpV34bKQKEBUQ9
	16tHz1J2VrTM/HrDd0bS1zkxsxw/nN2u7047xYfd+2mAZYO9O6c8Gg6A0eC6yd6VCVhYJfrOX4T
	6z4q1qTZJmWH4kS26/NOgek/pyTEbZCIVLvYQfyOMcaw1WeIna5axIQnWNDTO19qt0YKYoazqZP
	BZmxMBC7iexMNelWmRkKc+GprLOXitO63Tls0g2UDSB8yR1VhESLDedU5XzGy7teUSjg==
X-Received: by 2002:a05:6214:2025:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-908421a38e2mr30020526d6.4.1785499434242;
        Fri, 31 Jul 2026 05:03:54 -0700 (PDT)
Received: from localhost ([146.190.222.192])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-908435def8fsm8686026d6.38.2026.07.31.05.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:03:54 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: miklos@szeredi.hu
Cc: David Lee <david.lee@trailofbits.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fuse: wait for sync init request after abort
Date: Fri, 31 Jul 2026 12:03:52 +0000
Message-ID: <20260731120353.558833-1-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a fatal signal interrupts synchronous FUSE_INIT,
request_wait_answer() aborts the channel and returns immediately.  If the
request is in an FR_LOCKED reply-copy interval, fuse_chan_abort() leaves
it for the writer to finish.  The synchronous caller can then free the
fuse_init_args that owns the reply destination while the writer is still
copying into it.

Wait for fuse_request_end() after aborting the channel.  This keeps the
synchronous caller's reply storage alive until any locked copy has
finished, while preserving the fatal-signal abort behavior.

Fixes: 204aa22a686b ("fuse: abort on fatal signal during sync init")
Cc: stable@vger.kernel.org
Bug found and triaged by OpenAI Security Research and 
validated by Trail of Bits.

Assisted-by: Codex:gpt-5.6-sol gpt-5.5-cyber
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Trail of Bits has a reproducer for this bug that triggers a
KASAN use-after-free and can share if needed.

 fs/fuse/dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 5763a7cd3..deee1585d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -725,6 +725,8 @@ static void request_wait_answer(struct fuse_req *req)
 
 		if (req->args->abort_on_kill) {
 			fuse_chan_abort(fch, false);
+			wait_event(req->waitq,
+				   test_bit(FR_FINISHED, &req->flags));
 			return;
 		}
 
-- 
2.53.0
