Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4811241F7DE
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376784; cv=pass; b=Y1ZAFM99knCKqjdVxYopwdail9OV41zZqWzzKtFYYY8AJjq/itDyX027/65w+rlyx76wrxyE5+QjW6Qo7HKKB/u9A1wa9np1Kj6wasVInxGj5z8nMFj+NfisdWujoqRwXBTRNta/DMrQ7jyn7U3ifNPuP/BrB/gEx09FxjVHtIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376784; c=relaxed/simple;
	bh=Q5kKmKuz74OjHqFWqC7ok5g/jUJwk3ZRWBrRIcyf1Vw=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=fQAZr9BQemj7TNglsuLgP6eAD0mSFuWg71L1pmj+FFP7zf7eVrCgDdXo2/PWCwv9t7nG6oxGjcsG90NtRpXMe5mDtU+8qwynZOmZOiWFAlKkAfT/Qzk/6oseaLv6YnDrQCatEjuWzkH8uYOcoN2Nb2QW06KndY8tcE7HxwepYAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website; spf=pass smtp.mailfrom=soss.website; dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b=DoZi3s3l; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soss.website
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soss.website
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soss.website header.i=skye@soss.website header.b="DoZi3s3l"
ARC-Seal: i=1; a=rsa-sha256; t=1783376780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hs8L17bpNThxG1A39w1+eq91qYNjLHdwaEoKlHOKGegOjDLAsL25bU+Kfvrv8GZEp8UlnDM21R68h/3RWp8UXBqLiHYkds2QdLzjm1eOe+jVkNwQa7zJdPsyorcgLPeohf63apEWrC9BXVP9+jfkCkOaQw2XCxeY9AVH72c7j94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783376780; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Q5kKmKuz74OjHqFWqC7ok5g/jUJwk3ZRWBrRIcyf1Vw=; 
	b=UtBfhsou59FTq8VvaRMed+DsDUK/f2obOViYXaAMbKalV5lb6Yy43hfhtDeIM7YrgNCnq1LSmQtHus64FeoKytULkICFhGTN5UiN15lBavrdW62jjoWJei9qiMGESnXNgeCGx46Zz2EKlYYl56zHm/NsJISZeTK0LWQd9b2kZ8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soss.website;
	spf=pass  smtp.mailfrom=skye@soss.website;
	dmarc=pass header.from=<skye@soss.website>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783376780;
	s=zmail; d=soss.website; i=skye@soss.website;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Q5kKmKuz74OjHqFWqC7ok5g/jUJwk3ZRWBrRIcyf1Vw=;
	b=DoZi3s3lEMWQq/oWeWnrmt/8gyrcojg6fni+o5HAZEXgq7bOJW3iVVsConY8c7uC
	v3+glDJTL6Fb4mLn4T8xVCBTGpd3oJvwLhbClyi7WxFxBmDdkP5B309alqAZ+ekR5vB
	/T7abMK/qUQ7d2eq/vEcTAZ5NNivoO+1DOjWtqq8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1783376780215730.9427622197549; Mon, 6 Jul 2026 15:26:20 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1783376778791372.9653029310457; Mon, 6 Jul 2026 15:26:18 -0700 (PDT)
Date: Mon, 06 Jul 2026 17:26:18 -0500
From: Skye Soss <skye@soss.website>
To: "fuse-devel" <fuse-devel@lists.linux.dev>
Message-ID: <19f398a15e3.502695601806579.8550477790560725089@soss.website>
In-Reply-To: 
Subject: mount_service: possible implementation changes
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

Right now the new mount_service protocol works by first gaining root capabilities via fuservicemount being setuid, then communicating with a socket-activated systemd service to run the actual filesystem implementation in a sandboxed systemd unit.

I think there could be an improvement to the design by instead moving the privileged parts into a systemd socket activation unit, and having that privileged service spawn the containerized systemd unit as a child transient unit, or via socket activation with a root-only socket file.

Ie. The fuservicemount binary would be a non-setuid binary, and simply communicate with a socket in /run that is backed by a privileged socket-activated service. Upon activation, the service would use the peer credentials to enforce limits such as `mount_max`, and configure `/dev/fuse`. Finally, it would spawn the sandboxed systemd unit to run the filesystem, using `--scope` to transfer the file descriptors to the new process, or using socket activation with a socket file that only root can read and write to.

The advantage of this approach over the current design is compatibility with containers with the no_new_privileges security feature enabled. That disables privilege-elevation through execve (ie. setuid and setcaps binaries), but the use of systemd socket activation would still work.

The other advantage is limiting the access of the filesystem sandbox startup to the privileged service, which can prevent issues arising from parsing bugs (not privilege escalation, but potentially DOS issues by escaping the systemd resource-control group).

