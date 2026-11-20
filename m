Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186814;
	b=gTOQlARg/eEX+LG/0NXFDNX8NrQx2JPlmH+iz5vM90t7aOA20//L8N9EWZ+0FFYVZvne
	 4IreNx2RJnnyMvTcYLN9SPwOsV/N/q28+FM9KODGxv24CUdgHIJArNS0csyoLqMuptwQ1
	 P6lyokSe6IbJWtel2NPTgeeZSqJmT3K2K2AfDfaHEF0LD1Hb80jSHkw0e0Q7kF6VwgaNL
	 EeX/BFYoCWv2zZWvakNXCM6tH/+Z0lBUXZWJ/8QWumj4+OnFlqw9Q1M94xhHBshYqaKI8
	 iBqH34QCNqsn5LVWc5TtbS6haxDIH0vf5OMCJqk9S0ZedxEE3EymsaYA1S8A2fCRxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
	b=cCxG4917MrgjdEbiRmD9a0agagmzioYsH5+U7s7S+hoEJ4f8d88XLmJajr1xixCmAYjN
	 eU9iWZ4DHMWf8jo1VRdKPgb9u59zqUXe+gGjXXVPZpJtS5laugUMq3kWbeGPPb0D5WdOz
	 G/vjChTniPefll6wYbuZm0SUtzcpBR5Zo8QWdWmH9lQwt7vN/bRMmmw1nM5zKPqV/Hvte
	 natQAE2q/MEKy2tOEkXM8RJGEAadm/8/HFvEddajKcORDtj08I8Vk8Tsjn8wortFe/yhl
	 99p7i/+5V0mv0XP8Big/hziGFqXfVKfeTiHF82/wXVSRyqzlbzRxkK41d8cHPBRrb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5dGt8fZ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9060A2600
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 15:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F9060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5dGt8fZ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f03f3631b2so5723865ad.2
        for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186813; x=1795791613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
        b=g5dGt8fZidEc8s+suIDmqeCRTZYQl9VTSQShL3Bzn0MI2PgzZBZyuhR3zs/OLv+x+o
         clnkaBf0e5wlA+r00n9XqZ5VyvAhYRaHwyvABUro25Enywv0sP/N5urZVmcoDmKypS0W
         lzKC0BoyJgOl8H3GEY4lY1Ve7DYRKScupG4YNhzsFdLujxIVK36fkLjWF26DHTlZX20w
         9RfABL515t0r2/UXaCyWt9V086pIk6F08LZZYC9eqQ2LxgYGwFtAroWcgcbcIY+4tq5X
         luHuzeozxxOvVbX8mNy8AvgTs3YCO5q8eMUFwIAilu1JdGsU8WYkfiTLbXDCk8FXh6n5
         fz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186813; x=1795791613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
        b=QvG0u0e3C1sW+jL3adhD8YeecsKfbveWEn+Vl6ZUyknKaCLa0P3+AVCrZjPESA5WOj
         TlB739wYO5ZtzA7wECuDA/R1k8O/l+i6G7slTv2xs+6zg/TRkZU/LPJrDGTh6INSpyfh
         7Zjo69whMmTqDP1X/4SFRAqw8pV26QUgmyDQEvK2vvNOrKHl/lhir8faH6zESXCJoxdY
         8lCZzIWRPd8zDxCsHwRf1P3K7ds5CgUdOiHuhDQ5HdoofiRBswimXOWMWcVjE5Cdn6ED
         7OwbOeMj9uwXUYyJqxMYU0aiu8jpiiCyNq7zFVoFYBPogUtUsUT5C6+JknyEG70KmkoQ
         kHJg==
X-Gm-Message-State: APuU4Z8kOThCNC64pTFY6aBySLCCiLrtCivO1D7htUqPe3IV72JyzgEC
	zoCZ7qSk+5CRcwAVW30I12AJ+ZcuTAawptb0KFBH6eThvQE7Mu7BBlww
X-Gm-Gg: AZFdTZdVTxCjLcWrKOaFxixbUM0TzIY6EvJV+iDtN03Mvu52yrc4TqKXjRSrnfzUuHI
	kx9GumiysTtZyIMlIcltgnd6gTCelMjUi7xbcDeUHYdWisH/OCi3OJFL988qAX497aHa5lqHu5H
	DkLRz8SM7sSte2TjiZVrp1MWiOEJiltN/oBTtCyw8K/Vs6lqzFiJHYOtcUHfz6cyoV8YTiok+J9
	0NOEDqEEIW2u6IVuRk2K5tBKIueT0dqM6rGlCK7ZO8fSbiStnAGZfjg68+LKzdFpTjTczHXtWcs
	kzgPjCu7U4PRBU1I+krsS0wR8QoHbh1DoLRUoDf8e3zyBaXb5NyneZdQFETCYpMqWGaGuA++a1Y
	HiOh+DGNzUyj/KxShHF1CBisVcCBIPm2CcPhRHiXXx3G0PsnAuzkgKf0L1ZgvobKGW4pHO5Y4sH
	E9J79yKg7zrir6OVEsfol3EiHtw6IyuDa/4mr3VU/2bya1hkLokm3S3j5C293C0oXT+m1MPNjT7
	9mpcoTmn2sfi7vTtt1MNKJFeBUevQ/oxwuFWMmnyqKIffUsQphLCL28PqVffVjA/o/JP7SwB4JH
	uZRc080mmGvCoCQbmF63ACuf6GGzu9aOl5pQDV+AjJtYunIC/QKAnQ==
X-Received: by 2002:a17:902:ea0c:b0:2f0:3123:899c with SMTP id d9443c01a7336-2f03f0c1f37mr34277685ad.5.1795186813059;
        Fri, 20 Nov 2026 07:00:13 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:12 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: [PATCH v2 0/2] fuse: schedule dentry_tree_work only between dentry tree init and cleanup
Date: Sat, 21 Nov 2026 00:00:04 +0900
Message-ID: <20261120150008.1144420-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hello,

inval_wq_set() schedules dentry_tree_work when inval_wq is enabled, but
it can be called before fuse_dentry_tree_init() and after
fuse_dentry_tree_cleanup(). This series makes inval_wq_set() schedule
the work only between the two.

Patch 1 defers scheduling the work until fuse_dentry_tree_init() sets
it up.

Patch 2 does not schedule the work after fuse_dentry_tree_cleanup()
cancels it.

Both patches hold kernel_param_lock(), because a sysfs write can call
inval_wq_set() at the same time.

---
Changes from v1 [1]
- Hold kernel_param_lock() in fuse_dentry_tree_init()
- Add patch 2 to not schedule the work after fuse_dentry_tree_cleanup()

[1] https://lore.kernel.org/all/20261110150250.71520-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (2):
  fuse: defer dentry_tree_work until fuse_dentry_tree_init()
  fuse: do not schedule dentry_tree_work after
    fuse_dentry_tree_cleanup()

 fs/fuse/dir.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)


base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
-- 
2.53.0

