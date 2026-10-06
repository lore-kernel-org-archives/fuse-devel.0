Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77945BE3
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309691; cv=none; b=e51qzJ6jmwECktWC61w6t2zv+khbjWH/UgtNBpU3Gkng7Zjuns/7qV+xifjnDmTAL0qhHhYE0f2zoTWkj2ETgureL8DDmo8CqLIt1BTSjkJlCZDgWXXtFk9aEewPJ5HnoUjh/oXrlc3OQE3wIsApYtCYSQv0egk2or7Ai/T0UkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309691; c=relaxed/simple;
	bh=fgSnuoTru0M1RdnWdJ3W+h1U533c9s6oWqTxjipvO2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=igz/OK1v8HizTHdJshsbAh/qy+LIbHYrkEyykNciBEjv9dv+rhpS8fT33XXy8SxgPKvKZbSLMQ0y7ilxTJAg3Wn1GD0jQRWX0ItUzP7U7eNayFYrdKLxpZPUEHlCeC0mjI5GGhcRDbOBZBrwkOUJ01JDWhYovAzT7IkPM66MdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CzKWICa1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CzKWICa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791309687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yukm86LJzzz9J8hnEhUh3B7rrcrjSUe6dcN4L+kFZ5U=;
	b=CzKWICa1XP+uwMYpqnLeDCPrILTHueDudBBDm3qTnzzI0LVwlSe41we23fu9QoYaI9HJJ1
	xosUEMqPF7BbXXfTZ4b/rLskRb/f17PMFYIseK3PeA2PER4rHj4Ds0Lox76luwUcXBhXWr
	rVtxTzvQsMWQtcQP4GdXlcc3zsoS9q8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-MkybUQa9OL6ltPKEL_Nvag-1; Tue, 06 Oct 2026 14:01:26 -0400
X-MC-Unique: MkybUQa9OL6ltPKEL_Nvag-1
X-Mimecast-MFC-AGG-ID: MkybUQa9OL6ltPKEL_Nvag_1791309685
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2e4d39c795so360565966b.1
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 11:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791309685; x=1791914485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yukm86LJzzz9J8hnEhUh3B7rrcrjSUe6dcN4L+kFZ5U=;
        b=gE97eIyGNSZ7E0ewVL/LqbshMImdENAs/sCg5/i4EaIJc5BMwL9ihCSBO9HQ35Vr5Z
         wY7nEwSH5To/YEi+/73hc6CifhPdB83w486moR3dCe9eeRUUrXX9uRDANo/AT4rTxe+F
         +i8xWuhXDhOHSZY0tB8faOE3Cvjwh8a0k1MVx1EU/ydyx99w4vG5NGV2J/kwtdm+mvYw
         1xFlc+a7FkPwaSWnIS8Jh52yx+BlgT9zvmOBCAKstAshXx01nyvVHmhrkugXx2nzCX+6
         xtYHrFn/hkhftC4/y+lQLlnNEvBia014ICpu6hQhRrXqPDFtsf90uSDKSUhYPwSf0W2h
         qa2Q==
X-Gm-Message-State: AFq9FYJO4kiJIWaflkF+8ow01WGJkGLyAnDaWz5vD3Elo6BTivRvHYVj
	spmwYvIvg2X6+DQEA2Sb3EaNfVL5RH1RL/uPaWEoy4PcDNkWLj4Wtu9tiVxCbCJUZAJNtRAoHlO
	Cw83xmOzl2zWZps/hGbzMIGs+kxZowxzVaEQAmysh9AfF77mnQYTIyp0FjgbcqMzaYYpA/oNIrY
	emOIdflg9F6FZlU2EGNvHkCGvj5HMbaeEtemA0QYAWPE87v0o=
X-Gm-Gg: AYBFou0pQMOACiFZrscu+VITh/+z3GaselmdFYSrmrl9jzJJ5pI6n0g0EafIO1Ma83m
	A6u/d41Pr/6lC+2lSExgxUnE7u45okB5IcTyOZIWEMiEvOS6XE9W75YHl2rEBwPvwMEOd64x1Zk
	VjpacduvnComYrmtWbMam6nMaLrVihq9pz/OAny4Ue/lEmfYvrKuNkaCh0J3cK4egHb4CFiqvDh
	MmjeXlPMojdkS81xU2CmTwdPfdeuB2wJrdRpFJKgzYjLeTU2pX03UbH9GJxNQnUHGRiT+yZJl6X
	LmW3xG4CUrzIGsojFg/m6XyU6w6zEAR7fv+9qeca9UuWfkwnb6S0SqpDpCVBKmmc0RK9Yn5kYz4
	lK4ajwkkgjdtQR9zu6eM35A9zhqFcizf65ShpsbK12gQMYvFpWaUDzrhK
X-Received: by 2002:a05:6402:1ed6:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6afe29d4fbbmr2351544a12.20.1791309685044;
        Tue, 06 Oct 2026 11:01:25 -0700 (PDT)
X-Received: by 2002:a05:6402:1ed6:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6afe29d4fbbmr2351504a12.20.1791309684437;
        Tue, 06 Oct 2026 11:01:24 -0700 (PDT)
Received: from maszat.piliscsaba.szeredi.hu (188-142-152-55.pool.digikabel.hu. [188.142.152.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5942sm5056684a12.9.2026.10.06.11.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:01:23 -0700 (PDT)
From: Miklos Szeredi <mszeredi@redhat.com>
To: fuse-devel@lists.linux.dev
Cc: John Groves <john@groves.net>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: [PATCH v3 2/9] dax: use READ_ONCE() in dax_holder()
Date: Tue,  6 Oct 2026 20:01:07 +0200
Message-ID: <20261006180115.1425232-3-mszeredi@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006180115.1425232-1-mszeredi@redhat.com>
References: <20261006180115.1425232-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l2HVXlUmjgE1LHMllHpw_EtwDin_NoNjUJGfnmaWnmM_1791309685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Make sure that a non-NULL check in callers remains valid even when racing
with fs_put_dax().

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 drivers/dax/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 824e1f6df378..0a440f8b42e4 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -677,7 +677,7 @@ EXPORT_SYMBOL_GPL(put_dax);
  */
 void *dax_holder(struct dax_device *dax_dev)
 {
-	return dax_dev->holder_data;
+	return READ_ONCE(dax_dev->holder_data);
 }
 EXPORT_SYMBOL_GPL(dax_holder);
 
-- 
2.54.0

