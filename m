Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9013AEF22
	for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978194; cv=none; b=KIJSRy6kXU+fWmICwWmMpBdOszaEoj7xNQis29VfOLUHCSoPO1bQhjZ+pODnqzxfPRF3DK9moP4ok5I+NVX5oKl3DpdwiaAgCKA+9JgvSfRkSdQPXZwEk4DlL9wYr39hKRowMYumF2kD6ORzENl5AhRdqsAiGTBBA93g9evIymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978194; c=relaxed/simple;
	bh=IZf6t8sPZN1B+G6nvb7rFXFrG/QkXWtEe0zXAaVYtPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uXvSxJql3hSbIVjppDIz0b4/J+1UsbhdximzPMP3djR4Nkx8aKnTPYXo4n8MY6mE/aqsmzNzJu8u1OyfyS+Aj3cbfARYqT1KDOxev5i1Bt57iodhsbqlP9BSF5D2xcb9iw5MJeHaf+0TEM0IaaunVV6NdxcOfzOXMtEtd9l/BFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OzKwz3K3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OzKwz3K3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779978191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T2ez4wLwO2XJ3M2x5UCP7Se5+Vs6+9kWYp+rbjdRbK0=;
	b=OzKwz3K3QcHoq9OvuzMQAuc378zEMdMlIVHIpBoSFLBg2WfaU1xsKTZpKH4oQF+VGJk3Og
	NWUYhp2mbItfM5rbCA4jE87HPS2lW3qdUqexC2xx87hkwAQKkCde6vFpmNzHV2zhUZ9/bN
	MoJCDffhfjrvNwnq1+otV55L5HU3ZSw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-aXT3ff-DPAqgEalSmDZBOQ-1; Thu, 28 May 2026 10:23:10 -0400
X-MC-Unique: aXT3ff-DPAqgEalSmDZBOQ-1
X-Mimecast-MFC-AGG-ID: aXT3ff-DPAqgEalSmDZBOQ_1779978189
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45e2f74da10so11982083f8f.2
        for <fuse-devel@lists.linux.dev>; Thu, 28 May 2026 07:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779978189; x=1780582989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ez4wLwO2XJ3M2x5UCP7Se5+Vs6+9kWYp+rbjdRbK0=;
        b=NtSt+m6OLVIG6ejS0VArSS1k+Ey3zRQI6NMf4pd9mhxH6zoQ0aFICmxyvbfeKe7E0T
         HC3gqrrP7SdtPaCORw5i3RB4xcFigZD4bcyH30VhJDa8hcSjXARWoxXfuHi6xO0p9G0U
         CddEk8GUfcFCxoNhedaWc0XWsjN96n0vFxr2/m9UE2eRPpeScXMSJN5a7uIBsa27sXfC
         zZ2mZt4e3RTsy0fYaNk59rT26Lkv3JRSo5pAUBim+3S7nlOZ7fu/raitueYX8+VykuWY
         oh37c2talpmvg68OuUwUdBP2dCeBXGOR/7FY1tDzhL/Dq9N1d53WEax2tj1DDb5tAvK4
         hq1Q==
X-Gm-Message-State: AOJu0YyjMp6GR5Hbiz7sszsZbi9kqkhB/y/ERBZchcZrTqlh6J+H4NvU
	Gqe9l12bC6sEkR+BHubVPIsKPlfdSBCXHp5XK0tggQR/fOxJ2U5Zngd7uMDpTxmclbfsfOA1rPe
	uwpUjlZTQ2HShSXiZuEp0VkAFYDIz9OFtqjpYUe4ZPG+fm0AwPaS6vbx6QJGRPCzIKzYEOMpsnb
	QVmUF52qBSAA2rB7hKYsENPJY0uziePaYG4QonB/mEsmzEPPs=
X-Gm-Gg: Acq92OF440HtVKPBZJdGX+6WFYh0Yv+xdIrde79YnNaakxcXzbAdY0YW1qupl6OQjWn
	/2jCFy9MbqpavJDTTwYGooFoNQP49Qw4XQJ2aBETU+zAnfjwzld2H78422fo4pD8RjpyYdsuUEm
	Bz3CnkYUuiURgipuMjhfS25CUkZa9hQZN8j13Utxy2FfMgsLSc+uhEN6fwsUGvkECTcg37vO4gr
	vh3/0dYM8ebWtJ4Amu8GZ8m6yKmgbfAO5WP+92R/ZHD8nwDd5ahZiK8m6fGwsLNC53zoMezpF2v
	OztaPJoezaU3SfKAjrZuYBRsANPhl3AfC/cUTjUBEW67FDCuqCoqNYqPg6DodlLE3fxthd/7I5n
	WALEfi4NL0FYSjgf0pXzjv0iENT8KnQ/WZGe7lHeCF44oXTDnA5icVXUa/Mzkw8AcWzLzMO2Fus
	9fXIXXWMe2GmI=
X-Received: by 2002:a05:6000:25e3:b0:45e:73b4:85cc with SMTP id ffacd0b85a97d-45eb38a6b5amr42307162f8f.35.1779978188842;
        Thu, 28 May 2026 07:23:08 -0700 (PDT)
X-Received: by 2002:a05:6000:25e3:b0:45e:73b4:85cc with SMTP id ffacd0b85a97d-45eb38a6b5amr42307095f8f.35.1779978188310;
        Thu, 28 May 2026 07:23:08 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (78-131-46-194.pool.digikabel.hu. [78.131.46.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1a28sm13876873f8f.26.2026.05.28.07.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:23:07 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: =?UTF-8?q?Aur=C3=A9lien=20Bombo?= <abombo@microsoft.com>,
	Greg Kurz <gkurz@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] virtiofs: fix UAF on submount umount
Date: Thu, 28 May 2026 16:23:05 +0200
Message-ID: <20260528142306.1792392-1-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ez4-gv704Tgn6XOloRIcyV_ra3PvuwgJ7IOLGL_Sglk_1779978189
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

iput() called from fuse_release_end() can Oops if the super block has
already been destroyed.  Normally this is prevented by waiting for
num_waiting to go down to zero before commencing with super block shutdown.

This only works, however, for the last submount instance, as the wait
counter is per connection, not per superblock.

Revert to using synchronous release requests for the auto_submounts case,
which is virtiofs only at this time.

Reported-by: Aurélien Bombo <abombo@microsoft.com>
Cc: Greg Kurz <gkurz@redhat.com>
Closes: https://github.com/kata-containers/kata-containers/issues/12589
Fixes: 26e5c67deb2e ("fuse: fix livelock in synchronous file put from fuseblk workers")
Cc: stable@vger.kernel.org
Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 fs/fuse/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 3bdab8d03373..e8833e2a6610 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -380,8 +380,14 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 	 * aio and closes the fd before the aio completes.  Since aio takes its
 	 * own ref to the file, the IO completion has to drop the ref, which is
 	 * how the fuse server can end up closing its clients' files.
+	 *
+	 * Exception is virtio-fs, which is not affected by the above (server is
+	 * on host, cannot close open files in guest).  Virtio-fs needs sync
+	 * release, because the num_waiting mechanism to wait for all requests
+	 * before commencing with fs shutdown doesn't work if submounts are
+	 * used.
 	 */
-	fuse_file_put(ff, false);
+	fuse_file_put(ff, ff->fm->fc->auto_submounts);
 }
 
 void fuse_release_common(struct file *file, bool isdir)
-- 
2.54.0

