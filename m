Received: from sender6-of-o52.zoho.com (sender6-of-o52.zoho.com [165.173.180.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F22FD69D
	for <fuse-devel@lists.linux.dev>; Sun, 20 Sep 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930913; cv=pass; b=s0DrewhA4P63TNyxajFa9zL2NCXK+WxV0neaCAnPCiJL7NvSxacN6VngSkI90UOyeyD6Qq5rq3wlfMCVyfZZRMRJmdW0RCczv4Ri/GffSYsoCr7lnuGLBTdcgk57oayHB8gtHnaQbnBtT/K1Qr1Q+Hl9yKGCV7xpjSi+hlMIJec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930913; c=relaxed/simple;
	bh=41PFLszBqaydflrBG/RZ45CFqLkwqd98Co1YGdq4Ve4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Xk3km981XMaYFozzAmg9XemZVuKCVDMqT6yJ21cIRgQDIUMvKbz9pUkNTLmua9GjQdWyFDzqYGsDJAB1OzkH6vPwNghZzIFigmBjBc9lhlc4mx7jm4BC1o+uou8kue/Ynn6lSpocQrdeb8ySHuYE1QoHHYaCZ8hZfVwLyH6e4zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=guA05N8B; arc=pass smtp.client-ip=165.173.180.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="guA05N8B"
ARC-Seal: i=1; a=rsa-sha256; t=1789930908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gVaz+88ey+3msbGL7YZb+LqFYShMsN62baP2FP+bjz2PhV0X1NaW2A/BKc2/yBz42BuiJ9KGHSnEI7LoOsW2VOW2D1/SWUVV//fBjfrujXc3dXhJYGAJIBiTGEQGAXyve7Mp7QspGzKSvr0tzcuqHLGHKam+n4+2SN9KvYtlzGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789930908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=41PFLszBqaydflrBG/RZ45CFqLkwqd98Co1YGdq4Ve4=; 
	b=YJayiQ1YnUsE/ZeMBRq52GBrpAYVRSObN5aC55eFt1d6AXwaAOwV7XmqoHvMg//qfcHv5LVNv6lENlCyscPtqr0lv5hEk1r9FOCyK1fQwCE5zDfisuT3peeJ3qRlPf7bVE9JfV0lgJ/gnbGK/7aVXCt2OATb8GBnMOnYfQy2UTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789930908;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=41PFLszBqaydflrBG/RZ45CFqLkwqd98Co1YGdq4Ve4=;
	b=guA05N8B8ND3ibVVkxFONbLNrA7MQy6U/AYBVyJnyzpzS0m8bgWq3Pb6VRcIafw1
	j/yAo+1FnLWHIsIXN0aPTYVWOmEfYyk0zFDBFOWUBwWYzm8AVsdG0FcdL+nzOhp7/t7
	w725QvSJW9FcNCyGt0L5hgbxdR2GBbtKqmv/YnNY=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1789930908871331.42960239501383; Sun, 20 Sep 2026 12:01:48 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1789930908161397.3540554594164; Sun, 20 Sep 2026 12:01:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 14:01:48 -0500
From: Skye Soss <skye@soss.website>
To: "fuse-devel" <fuse-devel@lists.linux.dev>
Cc: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <1a0c03229ed.1b908e3c391748.1531711527420340195@soss.website>
In-Reply-To: 
Subject: fuservicemount as a systemd storage provider
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

The fuservicemount infrastructure that's currently being developed in the libfuse repository allows an administrator to
setup a service that can create sandboxed filesystem implementations on-demand.

There is a very similar interface that's being developed in systemd (added in 261) called Storage Providers[1].
The directory /run/systemd/io.systemd.StorageProvider/ contains Unix domain sockets, each of which is backed by a Varlink
service. The interface (modulo metadata + options) is essentially:

Acquire(name: string) -> (fileDescriptor: int)

systemd also provides a mount helper so that `mount -t storage` can transparently use the storage provider interface.

This seems like a very similar kind of setup to fuservicemount + mount.fuse, and I'm curious if there's anything missing
from the systemd interface that would stop fuservicemount from being implement in those terms.
I believe that systemd-nspawn and systemd-vmspawn are going to be extended to create mounts from these interfaces, so
compatibility would be useful.

[1]: https://www.freedesktop.org/software/systemd/man/latest/systemd-storage-fs@.service.html

